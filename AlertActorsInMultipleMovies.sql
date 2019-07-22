USE [msdb]
GO

/************************************* 
Object:  Alert [ActorInMultipleMovie]    
Script Date: 7/18/2018 1:09:30 PM 
*************************************/

EXEC msdb.dbo.sp_add_alert @name=N'ActorInMultipleMovie', 
		@message_id=0, 
		@severity=10, 
		@enabled=1, 
		@delay_between_responses=1800, 
		@include_event_description_in=1, 
		@notification_message=N'Actor working in multiple movies Failed ', 
		@event_description_keyword=N'Actor working in multiple movies Failed', 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO


--EXEC msdb.dbo.sp_add_alert @name = N'Severity 19 Error', 
--  @message_id = 0,   @severity = 19,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 19 Error', 
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name = N'Severity 20 Error', 
--  @message_id = 0,   @severity = 20,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 20 Error', 
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name=N'Severity 21 Error', 
--  @message_id = 0,   @severity = 21,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 21 Error', 
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name = N'Severity 22 Error', 
--  @message_id = 0,   @severity = 22,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 22 Error', 
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name = N'Severity 23 Error', 
--  @message_id = 0,   @severity = 23,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 23 Error', 
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name = N'Severity 24 Error', 
--  @message_id = 0,   @severity = 24,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 24 Error', 
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name = N'Severity 25 Error', 
--  @message_id = 0,   @severity = 25,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Severity 25 Error',
--  @operator_name = N'SQL_Alerts', @notification_method = 1;
 
--EXEC msdb.dbo.sp_add_alert @name = N'Error 825', 
--  @message_id = 825,  @severity = 0,  @include_event_description_in = 0;
 
--EXEC msdb.dbo.sp_add_notification @alert_name = N'Error 825',
--  @operator_name = N'SQL_Alerts', @notification_method = 1;