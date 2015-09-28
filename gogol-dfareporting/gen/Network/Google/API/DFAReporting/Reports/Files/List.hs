{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.API.DFAReporting.Reports.Files.List
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Lists files for a report.
--
-- /See:/ <https://developers.google.com/doubleclick-advertisers/reporting/ DCM/DFA Reporting And Trafficking API Reference> for @dfareporting.reports.files.list@.
module Network.Google.API.DFAReporting.Reports.Files.List
    (
    -- * REST Resource
      ReportsFilesListAPI

    -- * Creating a Request
    , reportsFilesList'
    , ReportsFilesList'

    -- * Request Lenses
    , rflQuotaUser
    , rflPrettyPrint
    , rflUserIp
    , rflReportId
    , rflProfileId
    , rflSortOrder
    , rflKey
    , rflPageToken
    , rflSortField
    , rflOauthToken
    , rflMaxResults
    , rflFields
    , rflAlt
    ) where

import           Network.Google.DFAReporting.Types
import           Network.Google.Prelude

-- | A resource alias for dfareporting.reports.files.list which the
-- 'ReportsFilesList'' request conforms to.
type ReportsFilesListAPI =
     "userprofiles" :>
       Capture "profileId" Int64 :>
         "reports" :>
           Capture "reportId" Int64 :>
             "files" :>
               QueryParam "quotaUser" Text :>
                 QueryParam "prettyPrint" Bool :>
                   QueryParam "userIp" Text :>
                     QueryParam "sortOrder" ReportsFilesList'SortOrder :>
                       QueryParam "key" Text :>
                         QueryParam "pageToken" Text :>
                           QueryParam "sortField" ReportsFilesList'SortField :>
                             QueryParam "oauth_token" Text :>
                               QueryParam "maxResults" Int32 :>
                                 QueryParam "fields" Text :>
                                   QueryParam "alt" Alt :> Get '[JSON] FileList

-- | Lists files for a report.
--
-- /See:/ 'reportsFilesList'' smart constructor.
data ReportsFilesList' = ReportsFilesList'
    { _rflQuotaUser   :: !(Maybe Text)
    , _rflPrettyPrint :: !Bool
    , _rflUserIp      :: !(Maybe Text)
    , _rflReportId    :: !Int64
    , _rflProfileId   :: !Int64
    , _rflSortOrder   :: !ReportsFilesList'SortOrder
    , _rflKey         :: !(Maybe Text)
    , _rflPageToken   :: !(Maybe Text)
    , _rflSortField   :: !ReportsFilesList'SortField
    , _rflOauthToken  :: !(Maybe Text)
    , _rflMaxResults  :: !(Maybe Int32)
    , _rflFields      :: !(Maybe Text)
    , _rflAlt         :: !Alt
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ReportsFilesList'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'rflQuotaUser'
--
-- * 'rflPrettyPrint'
--
-- * 'rflUserIp'
--
-- * 'rflReportId'
--
-- * 'rflProfileId'
--
-- * 'rflSortOrder'
--
-- * 'rflKey'
--
-- * 'rflPageToken'
--
-- * 'rflSortField'
--
-- * 'rflOauthToken'
--
-- * 'rflMaxResults'
--
-- * 'rflFields'
--
-- * 'rflAlt'
reportsFilesList'
    :: Int64 -- ^ 'reportId'
    -> Int64 -- ^ 'profileId'
    -> ReportsFilesList'
reportsFilesList' pRflReportId_ pRflProfileId_ =
    ReportsFilesList'
    { _rflQuotaUser = Nothing
    , _rflPrettyPrint = True
    , _rflUserIp = Nothing
    , _rflReportId = pRflReportId_
    , _rflProfileId = pRflProfileId_
    , _rflSortOrder = RFLSODescending
    , _rflKey = Nothing
    , _rflPageToken = Nothing
    , _rflSortField = RFLSFLastModifiedTime
    , _rflOauthToken = Nothing
    , _rflMaxResults = Nothing
    , _rflFields = Nothing
    , _rflAlt = JSON
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
rflQuotaUser :: Lens' ReportsFilesList' (Maybe Text)
rflQuotaUser
  = lens _rflQuotaUser (\ s a -> s{_rflQuotaUser = a})

-- | Returns response with indentations and line breaks.
rflPrettyPrint :: Lens' ReportsFilesList' Bool
rflPrettyPrint
  = lens _rflPrettyPrint
      (\ s a -> s{_rflPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
rflUserIp :: Lens' ReportsFilesList' (Maybe Text)
rflUserIp
  = lens _rflUserIp (\ s a -> s{_rflUserIp = a})

-- | The ID of the parent report.
rflReportId :: Lens' ReportsFilesList' Int64
rflReportId
  = lens _rflReportId (\ s a -> s{_rflReportId = a})

-- | The DFA profile ID.
rflProfileId :: Lens' ReportsFilesList' Int64
rflProfileId
  = lens _rflProfileId (\ s a -> s{_rflProfileId = a})

-- | Order of sorted results, default is \'DESCENDING\'.
rflSortOrder :: Lens' ReportsFilesList' ReportsFilesList'SortOrder
rflSortOrder
  = lens _rflSortOrder (\ s a -> s{_rflSortOrder = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
rflKey :: Lens' ReportsFilesList' (Maybe Text)
rflKey = lens _rflKey (\ s a -> s{_rflKey = a})

-- | The value of the nextToken from the previous result page.
rflPageToken :: Lens' ReportsFilesList' (Maybe Text)
rflPageToken
  = lens _rflPageToken (\ s a -> s{_rflPageToken = a})

-- | The field by which to sort the list.
rflSortField :: Lens' ReportsFilesList' ReportsFilesList'SortField
rflSortField
  = lens _rflSortField (\ s a -> s{_rflSortField = a})

-- | OAuth 2.0 token for the current user.
rflOauthToken :: Lens' ReportsFilesList' (Maybe Text)
rflOauthToken
  = lens _rflOauthToken
      (\ s a -> s{_rflOauthToken = a})

-- | Maximum number of results to return.
rflMaxResults :: Lens' ReportsFilesList' (Maybe Int32)
rflMaxResults
  = lens _rflMaxResults
      (\ s a -> s{_rflMaxResults = a})

-- | Selector specifying which fields to include in a partial response.
rflFields :: Lens' ReportsFilesList' (Maybe Text)
rflFields
  = lens _rflFields (\ s a -> s{_rflFields = a})

-- | Data format for the response.
rflAlt :: Lens' ReportsFilesList' Alt
rflAlt = lens _rflAlt (\ s a -> s{_rflAlt = a})

instance GoogleRequest ReportsFilesList' where
        type Rs ReportsFilesList' = FileList
        request = requestWithRoute defReq dFAReportingURL
        requestWithRoute r u ReportsFilesList'{..}
          = go _rflQuotaUser (Just _rflPrettyPrint) _rflUserIp
              _rflReportId
              _rflProfileId
              (Just _rflSortOrder)
              _rflKey
              _rflPageToken
              (Just _rflSortField)
              _rflOauthToken
              _rflMaxResults
              _rflFields
              (Just _rflAlt)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy ReportsFilesListAPI)
                      r
                      u