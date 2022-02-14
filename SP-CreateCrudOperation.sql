CREATE PROCEDURE CreateCrudOperation
(
	@Operation NVARCHAR(10),
	@ID INT=0,
	@Name NVARCHAR(100)=NULL,
	@Price DECIMAL(5,2)=0.0,
	@Description  NVARCHAR(100)=NULL
)
AS
BEGIN
	IF(@Operation = 'Select')
	BEGIN
		select * from InventoryDetails
	END
	ELSE IF(@Operation = 'SelectID')
	BEGIN
		select * from InventoryDetails WHERE Product_Id=@ID
	END
	ELSE IF(@Operation = 'Add')
	BEGIN
		INSERT INTO InventoryDetails(Name,Description,Price) VALUES(@Name,@Description,@Price)
	END
	ELSE IF(@Operation = 'Update')
	BEGIN
		UPDATE InventoryDetails
		SET Name=@Name,[Description]=@Description,Price=@Price
		WHERE Product_Id=@ID
	END
	ELSE IF(@Operation = 'Delete')
	BEGIN
		Delete FROM InventoryDetails WHERE Product_Id=@ID
	END
END