// import {} from ''
@component
export class SpawnTreasureAnimation extends BaseScriptComponent {

    @input
    sparklesPrefab: ObjectPrefab;
    @input 
    trailEffectPrefab: ObjectPrefab;
    @input
    chestPrefab: ObjectPrefab;

    @input
    audio: AudioComponent;

    // eventData: UpdateEvent,
    createObjectsFromPrefab( trailEffectPrefab:ObjectPrefab, chestPrefab:ObjectPrefab, sparklesPrefab:ObjectPrefab) {
        if (trailEffectPrefab && chestPrefab) {
            var trailEffect = trailEffectPrefab.instantiate(this.getSceneObject());
<<<<<<< HEAD
            var chest = chestPrefab.instantiate(this.getSceneObject());
=======
            //trailEffect.getTransform().setWorldPosition(new vec3(0,0,-50));
            var chest = chestPrefab.instantiate(this.getSceneObject());
            //chest.getTransform().setWorldPosition(new vec3(0,0,-50));
>>>>>>> 91ac87dbe491de799df2c304a1d57d641e7a9a4e
            var sparkles = sparklesPrefab.instantiate(this.getSceneObject());
            print("we did it.")
        }
    }

    onAwake() {
        print(this.trailEffectPrefab);
        print(this.chestPrefab);
        this.createObjectsFromPrefab(this.trailEffectPrefab, this.chestPrefab, this.sparklesPrefab)
        // var delayedEvent:DelayedCallbackEvent = this.createEvent("DelayedCallbackEvent");
        // delayedEvent.bind(this.createObjectsFromPrefab.bind(this, this.trailEffectPrefab,this.chestPrefab));
        // delayedEvent.reset(2);
        this.audio.play(1);
        print("delay started");
    }

    
}