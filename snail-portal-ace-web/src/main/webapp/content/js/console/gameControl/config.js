var cfg = {};
cfg.grid_load_data_url = contextPath + '/gameControl/findControlList.do';
cfg.grid_add_data_url = contextPath + '/gameControl/insertControl.do';
cfg.grid_edit_data_url = contextPath + '/gameControl/updateControl.do';
cfg.grid_delete_data_url = contextPath + '/gameControl/deleteControl.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "游戏控制";
cfg.rowNum= 10;
cfg.dataId= 'id';
cfg.gridHeight=window.innerHeight-373;
cfg.jgridEditWinWidth=550;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}