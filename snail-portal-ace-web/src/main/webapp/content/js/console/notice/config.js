var cfg = {};
cfg.grid_load_data_url = contextPath + '/notice/findNoticeList.do';
cfg.grid_add_data_url = contextPath + '/notice/insertNotice.do';
cfg.grid_edit_data_url = contextPath + '/notice/updateNotice.do';
cfg.grid_delete_data_url = contextPath + '/notice/deleteNoticeByNoticeId.do';
cfg.grid_selector= "#grid-table";
cfg.pager_selector= "#grid-pager";
cfg.caption= "公告";
cfg.rowNum= 10;
cfg.dataId= 'noticeId';
cfg.gridHeight=window.innerHeight-373;//
//cfg.gridHeight= 'auto',

cfg.jgridEditWinWidth=700;
cfg.jgridAlertWidth=400;
cfg.jgrdInfoDialogWidth=500;
if(cfg.gridHeight<100){
	cfg.gridHeight=250;
}