import {NewScript} from './SpawnTreasureInWorld';
import {MotionControllerHelper} from './testspec/MotionControllerHelper';
import {MotionControllerHelper2} from './testspec/MotionControllerHelper2';
import {MotionControllerHelper3} from './testspec/MotionControllerHelper3';

@component
export class GameManager extends BaseScriptComponent {
    //private minigameId:Number;

    @input
    moneyChest: SceneObject;     
    @input
    pinata: SceneObject;
    @input
    minigame: SceneObject;
    @input
    detector: SceneObject;
    @input
    spawnScript: NewScript;
    @input
    detectorScript: MotionControllerHelper;
    @input
    pinataScript: MotionControllerHelper2;  //Pinata script
    @input
    minigameScript: MotionControllerHelper3; //Minigame
    
    private moneyChestCompleted = false;
    private pinataCompleted = false;
    private minigameCompleted = false;
    
    private moneyChestChecked = false;
    private pinataChestChecked = false;
    private minigameChestChecked = false;
    
    onAwake() {    
        //var store = global.persistentStorageSystem.store;
        //if (store.getInt("gameID") > 0) {
        //    this.minigameId = store.getInt("gameID");
        //}  else {
        //    this.minigameId = -1; // not in game/challenge mode;
        //}
        
        //print(this.spawnScript.completed);
        // print(this.minigameScript.getTaskCompleted());
        this.spawnScript.targetObject = this.moneyChest;
        this.spawnScript.chooseTreasurePosition();
        this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
    }

    onUpdate() {
        this.moneyChestCompleted = this.spawnScript.getTaskCompleted();
        this.minigameCompleted = this.minigameScript.getTaskCompleted();
        this.pinataCompleted = this.pinataScript.getTaskCompleted();
        
        if (this.moneyChestCompleted && !this.moneyChestChecked) {
            this.spawnScript.found = false;
            this.spawnScript.targetObject = this.minigame;
            this.spawnScript.chooseTreasurePosition();
            this.moneyChestChecked = true;
            
        }
        else if (this.minigameCompleted && !this.minigameChestChecked) {
            this.spawnScript.found = false;
            this.spawnScript.targetObject = this.pinata;
            this.spawnScript.chooseTreasurePosition();
            this.minigameChestChecked = true;
            this.detector.enabled = true;
        }
        else if (this.pinataCompleted && !this.pinataChestChecked) {
            this.pinataChestChecked = true;
            this.detector.enabled = true;
        }
        
        //this.chest1Completed = this.chest3Script.getTaskCompleted();
        //this.chest3Completed = this.chest3Script.getTaskCompleted();   
        //this.chest2Completed = this.chest2Script.getTaskCompleted();
        
        //if (this.chest1Completed && this.spawnScript.found) {
           
         //   this.spawnScript.found = false;
         //   this.spawnScript.targetObject = this.chest2;
         //   this.spawnScript.chooseTreasurePosition();
        //}
        //else if (this.chest2Completed && this.spawnScript.found) {
            
        //    this.spawnScript.found = false;
        //    this.spawnScript.targetObject = this.chest3;
        //    this.spawnScript.chooseTreasurePosition();
       // }
       // else if (this.chest3Completed && this.spawnScript.found) {
        //    this.chest3Completed = true;
            
       // }
        
        
        
        
    }
}
