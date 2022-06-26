ALTER PROC [dbo].[Inventory_Insert]
			@Id int OUTPUT
			,@Quantity int
			,@BasePrice money
			,@User int
			,@WorkShopType nvarchar(100)
			,@Name nvarchar(255)
			,@Summary nvarchar(255)
			,@ShortDescription nvarchar(4000)
			,@VenueId int
			,@HostId int
			,@WorkShopStatusId int
			,@ImageUrl nvarchar(400)
			,@ExternalSiteUrl nvarchar(400)
			,@LanguageId int
			,@IsFree bit
			,@NumberofSessions int
			,@DateStart datetime2(7)
			,@DateEnd datetime2(7)

/*

	DECLARE @Id int = 0

	DECLARE	@Quantity int = 5
			,@BasePrice money = 5.35
			,@User int = 9
			,@WorkShopType nvarchar(100) = 'Outdoors'
			,@Name nvarchar(255) = 'Badmitten Online'
			,@Summary nvarchar(255) = 'Learn to play Badmitten online with your friends in the metaverse!'
			,@ShortDescription nvarchar(4000) = 'two players hit a birdie back and forth until someone drops the birdie'
			,@VenueId int = 42
			,@HostId int = 266
			,@WorkShopStatusId int = 1
			,@ImageUrl nvarchar(400) = 'https://play-lh.googleusercontent.com/9_aLnlveE9feW7hGAWf-1ZrKTu2QOIpk7k7DgMbXRUfP9s68T-766Cn0BoT37OAZWGM=w412-h220-rw',
			,@ExternalSiteUrl nvarchar(400) = NULL
			,@LanguageId int = 1
			,@IsFree bit = 0
			,@NumberOfSessions int = 4
			,@DateCreated datetime2(7) = getutcdate()
			,@DateModified datetime2(7) = getutcdate()
			,@DateStart datetime2(7) = '06/22/2022'
			,@DateEnd datetime2(7) = '07/12/2022'
			
			
			

	EXECUTE [dbo].[Inventory_Insert] 
			@Id OUTPUT
			,@Quantity 
			,@BasePrice
			,@User 
			,@WorkShopType 
			,@Name 
			,@Summary 
			,@ShortDescription
			,@VenueId
			,@HostId
			,@WorkShopStatusId 
			,@ImageUrl 
			,@ExternalSiteUrl 
			,@LanguageId 
			,@IsFree
			,@NumberOfSessions     
			,@DateStart 
			,@DateEnd 
									
									
	SELECT Id
			,WorkShopId
			,Quantity
			,BasePrice
			,DateCreated
			,DateModified
			,CreatedBy
			,ModifiedBy
	FROM dbo.Inventory
	WHERE Id = @Id

	SELECT *
	FROM dbo.WorkshopTypes

*/

AS

BEGIN

	DECLARE @WorkShopTypeId int = (
									SELECT Id 
									FROM dbo.WorkShopTypes 
									WHERE [NAME] = @WorkShopType
									)
	
	INSERT INTO  [dbo].[WorkShop] 
				([Name]
				,[Summary]
				,[ShortDescription]
				,VenueId
				,HostId 
				,WorkShopTypeId
				,WorkShopStatusId 
				,ImageUrl 
				,ExternalSiteUrl 
				,LanguageId 
				,IsFree 
				,NumberOfSessions
				,DateStart 
				,DateEnd)

		VALUES 
				(@Name
				,@Summary
				,@ShortDescription
				,@VenueId
				,@HostId 
				,@WorkShopTypeId
				,@WorkShopStatusId 
				,@ImageUrl 
				,@ExternalSiteUrl 
				,@LanguageId 
				,@IsFree 
				,@NumberOfSessions
				,@DateStart 
				,@DateEnd)

	DECLARE @WorkShopId int = SCOPE_IDENTITY() 

	INSERT INTO  [dbo].[Inventory] 
				([WorkShopId]
				,[Quantity]
				,[BasePrice]
				,CreatedBy
				,ModifiedBy)
				
		VALUES
				(@WorkShopId
				,@Quantity
				,@BasePrice
				,@User
				,@User)

		SET		@Id = SCOPE_IDENTITY()

END
