var cfg = {};
cfg.grid_load_data_url = contextPath + '/users/findUsersList.do';
cfg.grid_add_data_url = contextPath + '/users/insertUsers.do';
cfg.grid_edit_data_url = contextPath + '/users/updateUsers.do';
cfg.grid_delete_data_url = contextPath + '/users/updateUsersStatusByPrimaryKey.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "用户";
cfg.rowNum= 10;
cfg.dataId= 'userId';
cfg.gridHeight=window.innerHeight-373;//
//cfg.gridHeight= 'auto',

cfg.jgridEditWinWidth=700;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}