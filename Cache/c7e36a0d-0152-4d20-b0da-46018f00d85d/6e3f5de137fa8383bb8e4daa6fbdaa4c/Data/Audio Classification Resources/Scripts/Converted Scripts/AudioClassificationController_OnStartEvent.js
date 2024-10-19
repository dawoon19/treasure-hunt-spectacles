// @ui {"widget":"group_start", "label":"<b>Model Settings<\b>"}
// @input Asset.MLAsset model
// @input Asset.AudioTrackAsset audioSource {"label" : "Input Audio"}
// @input Component.ScriptComponent labels 
// @input bool extendedSuggestions {"label" : "Include Ancestors" , "hint" : "Include ancestors (parent classes) of detected classes"}
// @ui {"widget":"group_end"}
// @ui {"widget" : "separator"}
// @ui {"widget" : "label", "label" : "<b>Responses:<\b>"}
// @input bool callApiFunction {"hint" : "Call script api function and pass array of classes as parameter"}
// @input Component.ScriptComponent scriptWithApi {"showIf": "callApiFunction"}
// @input string functionName = "onClassDetected"  {"showIf": "callApiFunction"}
// @ui {"widget" : "separator"}
// @input bool useBehavior {"hint" : "Call custom behavior trigger for each detected class"}
// @input string customTriggerPrefix = "KEYWORD_"{"showIf" : "useBehavior", "label" : "Prefix"}
// @ui {"widget" : "separator"}
// @input bool printResultTo {"hint" : "Print array of detected classes to a text component"}
// @input Component.Text classText {"showIf" : "printResultTo"}
// @input string placeholderText = "Listening..."  {"showIf" : "printResultTo"}
// @ui {"widget" : "separator"}
// @input bool advanced
// @input Component.ScriptComponent audioSpectrogramScript {"showIf" : "advanced"}
// @input float deltaTime = 0.5 {"showIf" : "advanced", "hint" : "Run model every n seconds"}
// @input Component.Text debugText {"showIf" : "advanced"}
// @input Component.Image debugImage {"showIf" : "advanced"}
script.createEvent("OnStartEvent").bind(function() { require("AudioClassificationController_wrapped")(script)})