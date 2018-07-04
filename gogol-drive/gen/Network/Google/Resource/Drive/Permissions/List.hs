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
-- Module      : Network.Google.Resource.Drive.Permissions.List
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists a file\'s permissions.
--
-- /See:/ <https://developers.google.com/drive/ Drive API Reference> for @drive.permissions.list@.
module Network.Google.Resource.Drive.Permissions.List
    (
    -- * REST Resource
      PermissionsListResource

    -- * Creating a Request
    , permissionsList
    , PermissionsList

    -- * Request Lenses
    , plFileId
    ) where


import qualified Data.Text as T
import           Network.Google.Drive.Types
import           Network.Google.Prelude

-- | A resource alias for @drive.permissions.list@ method which the
-- 'PermissionsList' request conforms to.
type PermissionsListResource =
     "drive" :>
       "v3" :>
         "files" :>
           Capture "fileId" Text :>
             "permissions" :>
               QueryParam "alt" AltJSON :>
                 QueryParam "fields" Text :>
                   Get '[JSON] PermissionList

-- | Lists a file\'s permissions.
--
-- /See:/ 'permissionsList' smart constructor.
data PermissionsList = PermissionsList'
    { _plFileId :: Text
    , _plFields :: [Text]
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | Creates a value of 'PermissionsList' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'plFileId'
permissionsList :: Text -- ^ 'plFileId'
                -> [Text]
                -> PermissionsList
permissionsList pPlFileId_ pPlFields_=
    PermissionsList'
    { _plFileId = pPlFileId_
    , _plFields = pPlFields_
    }

-- | The ID of the file.
plFileId :: Lens' PermissionsList Text
plFileId = lens _plFileId (\ s a -> s{_plFileId = a})

plFields :: Lens' PermissionsList [Text]
plFields = lens _plFields (\ s a -> s{_plFields = a})

instance GoogleRequest PermissionsList where
        type Rs PermissionsList = PermissionList
        type Scopes PermissionsList =
             '["https://www.googleapis.com/auth/drive",
               "https://www.googleapis.com/auth/drive.file",
               "https://www.googleapis.com/auth/drive.metadata",
               "https://www.googleapis.com/auth/drive.metadata.readonly",
               "https://www.googleapis.com/auth/drive.photos.readonly",
               "https://www.googleapis.com/auth/drive.readonly"]
        requestClient PermissionsList'{..}
          = go _plFileId (Just AltJSON) (Just $ T.intercalate "," _plFields) driveService
          where go
                  = buildClient
                      (Proxy :: Proxy PermissionsListResource)
                      mempty
