{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds      #-}
{-# OPTIONS_GHC -fno-warn-unused-imports    #-}

-- |
-- Module      : Network.Google.Resource.Drive.Permissions.Get
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets a permission by ID.
--
-- /See:/ <https://developers.google.com/drive/ Drive API Reference> for @drive.permissions.get@.
module Network.Google.Resource.Drive.Permissions.Get
    (
    -- * REST Resource
      PermissionsGetResource

    -- * Creating a Request
    , permissionsGet
    , PermissionsGet

    -- * Request Lenses
    , pgFileId
    , pgPermissionId
    ) where

import qualified Data.Text as T
import           Network.Google.Drive.Types
import           Network.Google.Prelude

-- | A resource alias for @drive.permissions.get@ method which the
-- 'PermissionsGet' request conforms to.
type PermissionsGetResource =
     "drive" :>
       "v3" :>
         "files" :>
           Capture "fileId" Text :>
             "permissions" :>
               Capture "permissionId" Text :>
                  QueryParam "alt" AltJSON :> 
                    QueryParam "fields" Text :> Get '[JSON] Permission

-- | Gets a permission by ID.
--
-- /See:/ 'permissionsGet' smart constructor.
data PermissionsGet = PermissionsGet'
    { _pgFileId       :: !Text
    , _pgPermissionId :: !Text
    , _pgFields :: [Text]
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'PermissionsGet' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pgFileId'
--
-- * 'pgPermissionId'
permissionsGet
    :: Text -- ^ 'pgFileId'
    -> Text -- ^ 'pgPermissionId'
    -> [Text]
    -> PermissionsGet
permissionsGet pPgFileId_ pPgPermissionId_ pPgFields_ =
    PermissionsGet'
    { _pgFileId = pPgFileId_
    , _pgPermissionId = pPgPermissionId_
    , _pgFields = pPgFields_
    }

-- | The ID of the file.
pgFileId :: Lens' PermissionsGet Text
pgFileId = lens _pgFileId (\ s a -> s{_pgFileId = a})

-- | The ID of the permission.
pgPermissionId :: Lens' PermissionsGet Text
pgPermissionId
  = lens _pgPermissionId
      (\ s a -> s{_pgPermissionId = a})

pgFields :: Lens' PermissionsGet [Text]
pgFields = lens _pgFields (\ s a -> s{_pgFields = a})      

instance GoogleRequest PermissionsGet where
        type Rs PermissionsGet = Permission
        type Scopes PermissionsGet =
             '["https://www.googleapis.com/auth/drive",
               "https://www.googleapis.com/auth/drive.file",
               "https://www.googleapis.com/auth/drive.metadata",
               "https://www.googleapis.com/auth/drive.metadata.readonly",
               "https://www.googleapis.com/auth/drive.photos.readonly",
               "https://www.googleapis.com/auth/drive.readonly"]
        requestClient PermissionsGet'{..}
          = go _pgFileId _pgPermissionId (Just AltJSON) (Just $ T.intercalate "," _pgFields)
              driveService
          where go
                  = buildClient (Proxy :: Proxy PermissionsGetResource)
                      mempty
