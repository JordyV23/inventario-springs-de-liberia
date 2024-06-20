-- =============================================
-- Create date: 18/06/2024
-- Description: Procedimiento almacenado para registrar un usuario
-- =============================================
CREATE OR ALTER PROCEDURE PaRegisterPerson
    -- Add the parameters for the stored procedure here
    @cedula varchar(9),
    @nombreCompleto varchar(60),
    @telefono varchar(30),
    @correo varchar(max),
    @username varchar(30),
    @password varbinary(max),
    @rol char(1)
AS
BEGIN
    DECLARE @idUsuario int;
    DECLARE @errorMsg nvarchar(255);

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Start a transaction
    BEGIN TRANSACTION;

    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM TbUser WHERE username = @username)
    BEGIN
        SET @errorMsg = 'El nombre de usuario ya existe.';
        RAISERROR (@errorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Check if the cedula already exists
    IF EXISTS (SELECT 1 FROM TbPerson WHERE cedula = @cedula)
    BEGIN
        SET @errorMsg = 'La cédula ya está registrada.';
        RAISERROR (@errorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- If both checks pass, insert the user
    BEGIN TRY
        INSERT INTO TbUser (username, password, rol) 
        VALUES (@username, @password, @rol);

        SELECT @idUsuario = SCOPE_IDENTITY();

        -- Insert the person
        INSERT INTO TbPerson (cedula, nombreCompleto, telefono, correoElectronico, idUsuario) 
        VALUES (@cedula, @nombreCompleto, @telefono, @correo, @idUsuario);

        -- Commit the transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if any error occurs
        ROLLBACK TRANSACTION;
        -- Return the error message
        SET @errorMsg = ERROR_MESSAGE();
        RAISERROR (@errorMsg, 16, 1);
    END CATCH
END
GO
