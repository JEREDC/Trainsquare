ALTER PROC [dbo].[Inventory_Update]
			@Id int OUTPUT
			,@WorkShopId int
			,@Quantity int
			,@BasePrice money
			,@User int

/*

	DECLARE @Id int = 138
			,@WorkShopId int = 5
			,@Quantity int = 5
			,@BasePrice money = 30.99
			,@User int = 260

	EXECUTE [dbo].[Inventory_Update] 
			@Id
			,@WorkShopId
			,@Quantity
			,@BasePrice
			,@User

	SELECT *
	FROM dbo.Inventory
										 

*/
as

BEGIN

	DECLARE @date datetime2 = getutcdate();

	UPDATE  [dbo].[Inventory]

	SET		[WorkShopId] = @WorkShopId
			,[Quantity] = @Quantity
			,[BasePrice] = @BasePrice
			,[ModifiedBy] = @User
			,[DateCreated] = @date
			,[DateModified] = @date

	WHERE	Id = @Id

END
