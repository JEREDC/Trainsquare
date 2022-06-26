ALTER PROC [dbo].[Inventory_Select_ById]
				
				@Id int

/*

	Declare @Id int = 11

	Execute [dbo].[Inventory_Select_ById] @Id

*/

AS

BEGIN

	SELECT  i.[Id]			
			,i.[WorkShopId]
			,ws.Name
			,ws.Summary
			,ws.ImageUrl
			,i.CreatedBy
			,up.FirstName
			,up.LastName
			,up.AvatarUrl
			,i.ModifiedBy
			,up.FirstName
			,up.LastName
			,up.AvatarUrl
			,i.[Quantity]
			,i.[BasePrice]
			,i.DateCreated
			,i.DateModified
		
	FROM	[dbo].[Inventory] as i 
			inner join dbo.WorkShop as ws
				on i.WorkShopId = ws.Id
			inner join dbo.Users as u
				on i.CreatedBy = u.id
			inner join dbo.UserProfiles as up
				on u.Id = up.UserId
							
	WHERE	i.Id = @Id

	ORDER BY ws.Id

END
