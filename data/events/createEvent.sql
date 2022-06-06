-- INSERT INTO [dbo].[events]
--     (
--         [eventTitle],
--         [eventDescription],
--         [startDate],
--         [endDate],
--         [avenue],
--         [maxMembers]
--     )
-- VALUES 
--     (
--         @eventTitle,
--         @eventDescription,
--         @startDate,
--         @endDate,
--         @avenue,
--         @maxMembers
--     )


execute spInsertEvent
    @eventTitle,
    @eventDescription,
    @startDate,
    @endDate,
    @avenue,
    @maxMembers
