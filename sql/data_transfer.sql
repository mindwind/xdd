insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '31', 0
    from xdd.xdd_sqlserver_data
   where type = '信息公开';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '23', 0
    from xdd.xdd_sqlserver_data
   where type = '新闻中心';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '25', 0
    from xdd.xdd_sqlserver_data
   where type = '通知公告';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '26', 0
    from xdd.xdd_sqlserver_data
   where type = '经济社会发展';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '24', 0
    from xdd.xdd_sqlserver_data
   where type = '政府文件';