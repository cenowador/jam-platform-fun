/// @description follow parent
with(parent){
	var p = spawnCalculateJointPosition();
	other.x = p.xp;
	other.y = p.yp;
}
