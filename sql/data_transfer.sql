insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '31', 0
    from xdd.xdd_sqlserver_data
   where type = '��Ϣ����';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '23', 0
    from xdd.xdd_sqlserver_data
   where type = '��������';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '25', 0
    from xdd.xdd_sqlserver_data
   where type = '֪ͨ����';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '26', 0
    from xdd.xdd_sqlserver_data
   where type = '������ᷢչ';
   
insert into p_xdd.xdd_info
  (id, title, author, publish_time, content, group_id, state)
  select id, title, 'admin', pubtime, content, '24', 0
    from xdd.xdd_sqlserver_data
   where type = '�����ļ�';