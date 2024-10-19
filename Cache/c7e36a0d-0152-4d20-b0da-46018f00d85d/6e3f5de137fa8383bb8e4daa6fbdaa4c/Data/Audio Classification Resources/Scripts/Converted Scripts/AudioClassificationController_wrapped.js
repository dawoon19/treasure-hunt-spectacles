function scriptBody(script){ 
// AudioClassificationController.js
// Controls the audio spectrogram, passes spectrogram texture to the ML model and analyzes model output
// Outputs classes that pass probability treshold
// Version 1.0.0
// Event : onStartEvent 




var labels;
var ancestors;

var output;
var input;
var inputShape;
var inputDataArray;
var outputDataArray;

const repeatDataShape = new vec3(1, 1, 1);

var spectrogramData;

var mlComponent;
var audioSpectrogram;

var timeLeft = script.deltaTime;

var unclassifiedCount;
var unclassifiedIntervalThreshold = 60;

init();

function init() {
    if (!initSpectrogramController() || !initMLComponent()) {
        return;
    }
    if (script.useBehavior && global.behaviorSystem == undefined) {
        print("Warning, Behavior system not initialized. Make sure a Behavior script is present in the scene, and above this in the Objects panel hierarchy.");
        script.useBehavior = false;
    }
    updateText(script.placeholderText);
}

function initSpectrogramController() {
    if (!script.audioSpectrogramScript) {
        print("Warning, Audio Spectrogram Script is not set (under advanced checkbox)");
        return false;
    }
    if (!script.audioSource) {
        print("Warning, Audio Track is not set");
        return false;
    }
    audioSpectrogram = script.audioSpectrogramScript.api;
    audioSpectrogram.init(script.audioSource);
    spectrogramData = audioSpectrogram.getSpectrogramData();

    if (script.audioSource.control.isOfType("Provider.MicrophoneAudioProvider")) {
        print("Info, To start using Audio From Microphone enable it at the bottom of the Preview Panel");
        script.audioSource.control.start();
    } else {
        print("Info, You are using test Audio Track input. Click on the [Audio Track] input field of the Keyword Detection Controller and select [Audio From Microphone]");
        script.audioSource.control.loops = -1;
    }
    return true;
}

function initMLComponent() {
    //check inputs
    if (!script.model) {
        print("Warning, ML Model asset is not set");
        return false;
    }
    //set model
    if (script.labels == undefined || script.labels.api.labels == undefined) {
        print("Warning, script with Class Map is not set");
        return false;
    }
    //create and configure ml components
    mlComponent = script.getSceneObject().createComponent("Component.MLComponent");
    mlComponent.model = script.model;
    mlComponent.inferenceMode = MachineLearning.InferenceMode.CPU;
    
    mlComponent.onLoadingFinished = onLoadingFinished;
    mlComponent.onRunningFinished = onRunningFinished;
    mlComponent.build([]);

    //reference labels
    labels = script.labels.api.labels;
    ancestors = script.labels.api.ancestors;

    return true;
}

function onLoadingFinished() {
    //references to input and output
    input = mlComponent.getInput("input");
    output = mlComponent.getOutput("pred");
    inputDataArray = input.data;
    outputDataArray = output.data;
    inputShape = input.shape;

    var updateEvent = script.createEvent("UpdateEvent");
    updateEvent.bind(onUpdate);
}

function onUpdate(eventData) {
    //uncomment below to see live texture update
    //audioSpectrogram.updateSpectrogramTexture();

    var b = audioSpectrogram.processAudioFrame();
    spectrogramData = audioSpectrogram.getSpectrogramData();

    if (b == false
        || timeLeft > 0
        || mlComponent.state != MachineLearning.ModelState.Idle) {
        if (timeLeft > 0) {
            timeLeft -= eventData.getDeltaTime();

        }
        return;
    }

    audioSpectrogram.updateSpectrogramTexture();

    TensorMath.repeat(spectrogramData, inputShape, repeatDataShape, inputDataArray);

    mlComponent.runImmediate(false);
    timeLeft = script.deltaTime;
}


function onRunningFinished() {
    var classes = {};
    var count = 0;
    for (var i = 0; i < outputDataArray.length; i++) {
        if (outputDataArray[i] == 1) {
            classes[labels[i]] = true;
            count++;
            if (script.extendedSuggestions) {
                //addUniqueElements(classes, ancestors[labels[i]]);
                for (var j = 0; j < ancestors[labels[i]].length; j++) {
                    classes[ancestors[labels[i]][j]] = true;
                    count++;
                }
            }
        }
    }
    //print(JSON.stringify(classes));
    var result = Object.keys(classes);
    //print(result.length == count);
    if (count > 0) {
        updateText(result.join("\n"));
        //call api function if needed 
        if (script.callApiFunction && script.scriptWithApi && script.functionName.length > 0) {
            if (script.scriptWithApi.api[script.functionName]) {
                script.scriptWithApi.api[script.functionName](result);
            } else {
                print("Warning, api function " + script.functionName + " is not found");
            }
        }
        //call behavior trigger for each class
        if (script.useBehavior) {
            for (var k = 0; k < count; k++) {
                global.behaviorSystem.sendCustomTrigger(script.customTriggerPrefix + result[k]);
            }
        }
        //reset unclassified frames count
        unclassifiedCount = 0;
    } else {
        unclassifiedCount++;
    }
    if (unclassifiedCount >= unclassifiedIntervalThreshold) {
        unclassifiedCount = 0;
        updateText(script.placeholderText);
    }
    timeLeft = script.deltaTime;
}

function updateText(text) {
    if (script.printResultTo) {
        if (script.classText) {
            script.classText.text = text;
        }
    }
    if (script.debugText) {
        script.debugText.text = text;
    }
}

 }; module.exports = scriptBody;