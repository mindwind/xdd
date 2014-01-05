update xdd_info t set t.org_id=(select id from xdd_org where name = '发改局') where t.id='SYS_4';
update xdd_info t set t.org_id=(select id from xdd_org where name = '经济局') where t.id='SYS_7';
update xdd_info t set t.org_id=(select id from xdd_org where name = '文旅局') where t.id='SYS_10';
update xdd_info t set t.org_id=(select id from xdd_org where name = '建设局') where t.id='SYS_13';
update xdd_info t set t.org_id=(select id from xdd_org where name = '环保局') where t.id='SYS_16';
update xdd_info t set t.org_id=(select id from xdd_org where name = '公安局') where t.id='SYS_19';
update xdd_info t set t.org_id=(select id from xdd_org where name = '司法局') where t.id='SYS_22';
update xdd_info t set t.org_id=(select id from xdd_org where name = '监察局') where t.id='SYS_2';
update xdd_info t set t.org_id=(select id from xdd_org where name = '民政局') where t.id='SYS_5';
update xdd_info t set t.org_id=(select id from xdd_org where name = '财政局') where t.id='SYS_8';
update xdd_info t set t.org_id=(select id from xdd_org where name = '人劳局') where t.id='SYS_11';
update xdd_info t set t.org_id=(select id from xdd_org where name = '交通局') where t.id='SYS_14';
update xdd_info t set t.org_id=(select id from xdd_org where name = '农业局') where t.id='SYS_17';
update xdd_info t set t.org_id=(select id from xdd_org where name = '林业局') where t.id='SYS_20';
update xdd_info t set t.org_id=(select id from xdd_org where name = '畜牧局') where t.id='SYS_23';
update xdd_info t set t.org_id=(select id from xdd_org where name = '水利局') where t.id='SYS_3';
update xdd_info t set t.org_id=(select id from xdd_org where name = '教育局') where t.id='SYS_6';
update xdd_info t set t.org_id=(select id from xdd_org where name = '卫生局') where t.id='SYS_9';
update xdd_info t set t.org_id=(select id from xdd_org where name = '人口局') where t.id='SYS_12';
update xdd_info t set t.org_id=(select id from xdd_org where name = '审计局') where t.id='SYS_15';
update xdd_info t set t.org_id=(select id from xdd_org where name = '统计局') where t.id='SYS_18';
update xdd_info t set t.org_id=(select id from xdd_org where name = '科技局') where t.id='SYS_21';
update xdd_info t set t.org_id=(select id from xdd_org where name = '地税局') where t.id='SYS_26';
update xdd_info t set t.org_id=(select id from xdd_org where name = '工商局') where t.id='SYS_27';
update xdd_info t set t.org_id=(select id from xdd_org where name = '质检局') where t.id='SYS_25';
update xdd_info t set t.org_id=(select id from xdd_org where name = '安监局') where t.id='SYS_24';
commit;




