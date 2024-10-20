const MotionControllerModule = require('LensStudio:MotionControllerModule');

@component
export class MotionControllerHelper extends BaseScriptComponent {
  private transform;
  public controller;

  @input
  childObject: SceneObject;

  @input 
  childCollider: ColliderComponent;

  @input
  targetObj: SceneObject;

    @input 
    trailEffectPrefab: ObjectPrefab;

    @input
    audio: AudioComponent;

  private pinataHealth;

  onAwake() {
    this.pinataHealth = 100;
    var options = MotionController.Options.create();
    options.motionType = MotionController.MotionType.SixDoF;
    this.controller = MotionControllerModule.getController(options);

    this.transform = this.sceneObject.getTransform();
    this.controller.onTransformEvent.add(this.updateTransform.bind(this));

    // make sure its only detected for "layer 2" objects
    this.childCollider.onCollisionExit.add(this.detectCollision.bind(this));
  }

  updateTransform(position, rotation) {
    this.transform.setWorldPosition(position);
    this.transform.setWorldRotation(rotation);
  }

  createObjectsFromPrefab( trailEffectPrefab:ObjectPrefab) {
    if (trailEffectPrefab) {
        var trailEffect = trailEffectPrefab.instantiate(this.getSceneObject());
        print("we did it.")
    }
}

  detectCollision(){
    if (this.childObject.enabled) {
        var request = MotionController.HapticRequest.create()

        request.hapticFeedback = MotionController.HapticFeedback.VibrationHigh
        request.duration = 1.0
        this.controller.invokeHaptic(request)

        print(this.pinataHealth);
        this.pinataHealth -= 20;
        if (this.pinataHealth <= 0) { 
            this.targetObj.enabled = false
            this.createObjectsFromPrefab(this.trailEffectPrefab)
            this.audio.play(1);
        }
    }
  }
}

//   testFunc() {
//     this.controller.isControllerAvailable;
//   }
