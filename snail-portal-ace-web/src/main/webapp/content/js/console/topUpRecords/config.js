var cfg = {};
cfg.grid_load_data_url = contextPath + '/topUpRecords/findRecordsList.do';
//cfg.grid_add_data_url = contextPath + '/logs/insertLogs.do';
//cfg.grid_edit_data_url = contextPath + '/logs/updateLogs.do';
//cfg.grid_delete_data_url = contextPath + '/logs/deleteLogsByLogsId.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "充值记录";
cfg.rowNum= 10;
cfg.dataId= 'id';
cfg.gridHeight=window.innerHeight-373;
cfg.jgridEditWinWidth=550;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}