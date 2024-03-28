
USE Demo_Project;
SELECT * FROM Project_Demo_Table;

DECLARE @pid INT = 0;
DECLARE @units INT = 0;
DECLARE @price MONEY = 0;


--Inside the WHILE loop, it waits for a delay of zero seconds using WAITFOR DELAY '00:00:00',
--effectively pausing the execution for a brief moment.
WHILE (1=1)
BEGIN
    WAITFOR DELAY '00:00:00';
	--Depending on the value of @pid, it calculates the corresponding @price.
	--If @pid is 1, it calculates @price as 10.10 * @units,
	--if @pid is 2, it calculates @price as 6.00 * @units, and if @pid is 3, it calculates @price as 9.2 * @units.
    SET @pid = ROUND(RAND()*3, 0)+1;
    SET @units = ROUND(RAND()*10, 0)+1;
	--@pid, @units, and @price to hold the values for each row to be inserted.
    IF @pid = 1
        SET @price = 10.10*@units;
    ELSE IF @pid = 2
        SET @price = 6.00*@units;
    ELSE IF @pid = 3
        SET @price = 9.2*@units;

    INSERT INTO Project_Demo_Table VALUES (GETDATE(), @pid, @units, @price);
END

SELECT * FROM Project_Demo_Table;