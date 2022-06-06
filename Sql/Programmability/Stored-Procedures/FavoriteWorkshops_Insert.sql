ALTER Proc [dbo].[FavoriteWorkshops_Insert]
			@UserId int,
			@WorkShopId int,
			@Id int OUTPUT

/* -------------   TEST CODE       -------------
	
	Declare @UserId int = 1,
			@WorkShopId int = 8,
			@Id int

	Execute dbo.FavoriteWorkshops_Insert
			@UserId,
			@WorkShopId,
			@UserId OUTPUT

	Select *
	From dbo.FavoriteWorkshops

*/

as

BEGIN

	INSERT INTO dbo.FavoriteWorkshops
				(
					[UserId],
					[WorkShopId]
				)
		VALUES
				(
					@UserId,
					@WorkShopId
				)

	SET @Id = SCOPE_IDENTITY();

END
