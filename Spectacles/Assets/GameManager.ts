@component
export class GameManager extends BaseScriptComponent {
    private minigameId:Number;

    onAwake() {    
        var store = global.persistentStorageSystem.store;
        if (store.getInt("gameID") > 0) {
            this.minigameId = store.getInt("gameID");
        }  else {
            this.minigameId = -1; // not in game/challenge mode;
        }
    }

}
