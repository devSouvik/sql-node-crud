-- DELETE [dbo].[events]
-- WHERE [eventId]=@eventId


EXECUTE spDeleteEvent 
@eventId;
