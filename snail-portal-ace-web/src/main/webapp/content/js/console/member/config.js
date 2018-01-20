var cfg = {};
cfg.grid_load_data_url = contextPath + '/member/findMemberList.do';
cfg.grid_add_data_url = contextPath + '/member/insertMember.do';
cfg.grid_edit_data_url = contextPath + '/member/updateMember.do';
cfg.grid_delete_data_url = contextPath
		+ '/member/updateMemberStatusByPrimaryKey.do';
cfg.grid_topup_data_url = contextPath + '/member/topUpMember.do';
cfg.grid_setupagentbysystemuser_data_url = contextPath + '/member/setUpAgentBySystemUser.do';
cfg.grid_selector = "#grid-table";
cfg.pager_selector = "#grid-pager";
cfg.caption = "会员";
cfg.rowNum = 10;
cfg.dataId = 'userId';
cfg.gridHeight = window.innerHeight - 373;//
// cfg.gridHeight= 'auto',

cfg.jgridEditWinWidth = 700;
cfg.jgridAlertWidth = 400;
cfg.jgrdInfoDialogWidth = 500;
if (cfg.gridHeight < 100) {
	cfg.gridHeight = 250;
}