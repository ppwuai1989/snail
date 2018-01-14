var cfg = {};
cfg.grid_load_data_url = contextPath + '/resources/findResourcesList.do';
cfg.grid_add_data_url = contextPath + '/resources/insertResources.do';
cfg.grid_edit_data_url = contextPath + '/resources/updateResources.do';
cfg.grid_delete_data_url = contextPath + '/resources/deleteResourcesByResourcesId.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "资源";
cfg.rowNum= 10;
cfg.dataId= 'resourcesId';
cfg.gridHeight=window.innerHeight-373;
cfg.jgridEditWinWidth=550;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}