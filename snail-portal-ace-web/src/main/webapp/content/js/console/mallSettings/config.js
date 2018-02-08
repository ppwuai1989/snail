var cfg = {};
cfg.grid_load_data_url = contextPath + '/mallSettings/findList.do';
cfg.grid_add_data_url = contextPath + '/mallSettings/insertSettings.do';
cfg.grid_edit_data_url = contextPath + '/mallSettings/updateSettings.do';
cfg.grid_delete_data_url = contextPath + '/mallSettings/deleteSettings.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "商城设置";
cfg.rowNum= 20;
cfg.dataId= 'id';
cfg.gridHeight=window.innerHeight-373;
cfg.jgridEditWinWidth=550;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}