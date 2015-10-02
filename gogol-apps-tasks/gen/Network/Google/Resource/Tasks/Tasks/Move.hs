{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Tasks.Tasks.Move
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Moves the specified task to another position in the task list. This can
-- include putting it as a child task under a new parent and\/or move it to
-- a different position among its sibling tasks.
--
-- /See:/ <https://developers.google.com/google-apps/tasks/firstapp Tasks API Reference> for @TasksTasksMove@.
module Network.Google.Resource.Tasks.Tasks.Move
    (
    -- * REST Resource
      TasksMoveResource

    -- * Creating a Request
    , tasksMove'
    , TasksMove'

    -- * Request Lenses
    , tmParent
    , tmQuotaUser
    , tmPrettyPrint
    , tmUserIP
    , tmKey
    , tmTaskList
    , tmTask
    , tmOAuthToken
    , tmFields
    , tmPrevious
    ) where

import           Network.Google.AppsTasks.Types
import           Network.Google.Prelude

-- | A resource alias for @TasksTasksMove@ which the
-- 'TasksMove'' request conforms to.
type TasksMoveResource =
     "lists" :>
       Capture "tasklist" Text :>
         "tasks" :>
           Capture "task" Text :>
             "move" :>
               QueryParam "parent" Text :>
                 QueryParam "quotaUser" Text :>
                   QueryParam "prettyPrint" Bool :>
                     QueryParam "userIp" Text :>
                       QueryParam "key" Key :>
                         QueryParam "oauth_token" OAuthToken :>
                           QueryParam "fields" Text :>
                             QueryParam "previous" Text :>
                               QueryParam "alt" AltJSON :> Post '[JSON] Task

-- | Moves the specified task to another position in the task list. This can
-- include putting it as a child task under a new parent and\/or move it to
-- a different position among its sibling tasks.
--
-- /See:/ 'tasksMove'' smart constructor.
data TasksMove' = TasksMove'
    { _tmParent      :: !(Maybe Text)
    , _tmQuotaUser   :: !(Maybe Text)
    , _tmPrettyPrint :: !Bool
    , _tmUserIP      :: !(Maybe Text)
    , _tmKey         :: !(Maybe Key)
    , _tmTaskList    :: !Text
    , _tmTask        :: !Text
    , _tmOAuthToken  :: !(Maybe OAuthToken)
    , _tmFields      :: !(Maybe Text)
    , _tmPrevious    :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'TasksMove'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'tmParent'
--
-- * 'tmQuotaUser'
--
-- * 'tmPrettyPrint'
--
-- * 'tmUserIP'
--
-- * 'tmKey'
--
-- * 'tmTaskList'
--
-- * 'tmTask'
--
-- * 'tmOAuthToken'
--
-- * 'tmFields'
--
-- * 'tmPrevious'
tasksMove'
    :: Text -- ^ 'tasklist'
    -> Text -- ^ 'task'
    -> TasksMove'
tasksMove' pTmTaskList_ pTmTask_ =
    TasksMove'
    { _tmParent = Nothing
    , _tmQuotaUser = Nothing
    , _tmPrettyPrint = True
    , _tmUserIP = Nothing
    , _tmKey = Nothing
    , _tmTaskList = pTmTaskList_
    , _tmTask = pTmTask_
    , _tmOAuthToken = Nothing
    , _tmFields = Nothing
    , _tmPrevious = Nothing
    }

-- | New parent task identifier. If the task is moved to the top level, this
-- parameter is omitted. Optional.
tmParent :: Lens' TasksMove' (Maybe Text)
tmParent = lens _tmParent (\ s a -> s{_tmParent = a})

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
tmQuotaUser :: Lens' TasksMove' (Maybe Text)
tmQuotaUser
  = lens _tmQuotaUser (\ s a -> s{_tmQuotaUser = a})

-- | Returns response with indentations and line breaks.
tmPrettyPrint :: Lens' TasksMove' Bool
tmPrettyPrint
  = lens _tmPrettyPrint
      (\ s a -> s{_tmPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
tmUserIP :: Lens' TasksMove' (Maybe Text)
tmUserIP = lens _tmUserIP (\ s a -> s{_tmUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
tmKey :: Lens' TasksMove' (Maybe Key)
tmKey = lens _tmKey (\ s a -> s{_tmKey = a})

-- | Task list identifier.
tmTaskList :: Lens' TasksMove' Text
tmTaskList
  = lens _tmTaskList (\ s a -> s{_tmTaskList = a})

-- | Task identifier.
tmTask :: Lens' TasksMove' Text
tmTask = lens _tmTask (\ s a -> s{_tmTask = a})

-- | OAuth 2.0 token for the current user.
tmOAuthToken :: Lens' TasksMove' (Maybe OAuthToken)
tmOAuthToken
  = lens _tmOAuthToken (\ s a -> s{_tmOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
tmFields :: Lens' TasksMove' (Maybe Text)
tmFields = lens _tmFields (\ s a -> s{_tmFields = a})

-- | New previous sibling task identifier. If the task is moved to the first
-- position among its siblings, this parameter is omitted. Optional.
tmPrevious :: Lens' TasksMove' (Maybe Text)
tmPrevious
  = lens _tmPrevious (\ s a -> s{_tmPrevious = a})

instance GoogleAuth TasksMove' where
        authKey = tmKey . _Just
        authToken = tmOAuthToken . _Just

instance GoogleRequest TasksMove' where
        type Rs TasksMove' = Task
        request = requestWithRoute defReq appsTasksURL
        requestWithRoute r u TasksMove'{..}
          = go _tmParent _tmQuotaUser (Just _tmPrettyPrint)
              _tmUserIP
              _tmKey
              _tmTaskList
              _tmTask
              _tmOAuthToken
              _tmFields
              _tmPrevious
              (Just AltJSON)
          where go
                  = clientWithRoute (Proxy :: Proxy TasksMoveResource)
                      r
                      u