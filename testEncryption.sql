

--Create table SquadInformation( id int, TeamName varchar(10),TeamCity varchar(300),
--TeamCaptain varchar(50), teamFifaNumber int);

--insert into SquadInformation values (1,'Tenzin','1502 West Apple Road, Taylorsville', '8018642098','987654321');

--If there is no master key, create one now. 
IF NOT EXISTS 
    (SELECT * FROM sys.symmetric_keys WHERE symmetric_key_id = 101)
    CREATE MASTER KEY ENCRYPTION BY 
    PASSWORD = 'Tseringdolkar1971!'
GO

CREATE CERTIFICATE customerInformation
   WITH SUBJECT = 'BankInformation ID';
GO

CREATE SYMMETRIC KEY SSN_Key_01
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE customerInformation;
GO


-- Create a column in which to store the encrypted data.
ALTER TABLE customerInformation
    ADD EncryptedAccountNumber varbinary(128); 
GO

-- Open the symmetric key with which to encrypt the data.
OPEN SYMMETRIC KEY SSN_Key_01
   DECRYPTION BY CERTIFICATE customerInformation;

-- Encrypt the value in column AccountNumber with symmetric 
-- key SSN_Key_01. Save the result in column EncryptedAccountNumber.
--UPDATE TeamInformation
--SET EncryptedFifaNumber = EncryptByKey(Key_GUID('SSN_Key_01'), convert(nvarchar,teamFifaNumber));
--GO

-- Verify the encryption.
-- First, open the symmetric key with which to decrypt the data.
OPEN SYMMETRIC KEY SSN_Key_01
   DECRYPTION BY CERTIFICATE customerInformation;
GO

--Creating Database Encryption Key
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE customerInformation; 


--Enabling TDE
ALTER DATABASE EncryptedDatabase 
SET ENCRYPTION ON;
GO
-- Now list the original ID, the encrypted ID, and the 
-- decrypted ciphertext. If the decryption worked, the original
-- and the decrypted ID will match.
--SELECT ID,TeamName, TeamCity,TeamCaptain, EncryptedFifaNumber
--    AS 'Encrypted Bank Account',
--    CONVERT(nvarchar, DecryptByKey(EncryptedFifaNumber)) 
--    AS 'Decrypted Bank Account'
--    FROM TeamInformation;
--GO
