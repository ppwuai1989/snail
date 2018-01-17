var cfg = {};
cfg.grid_load_data_url = contextPath + '/agent/findAgentList.do';
cfg.grid_add_data_url = contextPath + '/agent/insertMember.do';
cfg.grid_edit_data_url = contextPath + '/agent/updateAgent.do';
cfg.grid_delete_data_url = contextPath + '/agent/updateMemberStatusByPrimaryKey.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "代理";
cfg.rowNum= 10;
cfg.dataId= 'agentId';
cfg.gridHeight=window.innerHeight-373;//
//cfg.gridHeight= 'auto',

cfg.jgridEditWinWidth=700;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}