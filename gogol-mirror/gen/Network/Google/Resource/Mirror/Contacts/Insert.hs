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
-- Module      : Network.Google.Resource.Mirror.Contacts.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Inserts a new contact.
--
-- /See:/ <https://developers.google.com/glass Google Mirror API Reference> for @MirrorContactsInsert@.
module Network.Google.Resource.Mirror.Contacts.Insert
    (
    -- * REST Resource
      ContactsInsertResource

    -- * Creating a Request
    , contactsInsert'
    , ContactsInsert'

    -- * Request Lenses
    , ciQuotaUser
    , ciPrettyPrint
    , ciContact
    , ciUserIP
    , ciKey
    , ciOAuthToken
    , ciFields
    ) where

import           Network.Google.Mirror.Types
import           Network.Google.Prelude

-- | A resource alias for @MirrorContactsInsert@ which the
-- 'ContactsInsert'' request conforms to.
type ContactsInsertResource =
     "contacts" :>
       QueryParam "quotaUser" Text :>
         QueryParam "prettyPrint" Bool :>
           QueryParam "userIp" Text :>
             QueryParam "key" Key :>
               QueryParam "oauth_token" OAuthToken :>
                 QueryParam "fields" Text :>
                   QueryParam "alt" AltJSON :>
                     ReqBody '[JSON] Contact :> Post '[JSON] Contact

-- | Inserts a new contact.
--
-- /See:/ 'contactsInsert'' smart constructor.
data ContactsInsert' = ContactsInsert'
    { _ciQuotaUser   :: !(Maybe Text)
    , _ciPrettyPrint :: !Bool
    , _ciContact     :: !Contact
    , _ciUserIP      :: !(Maybe Text)
    , _ciKey         :: !(Maybe Key)
    , _ciOAuthToken  :: !(Maybe OAuthToken)
    , _ciFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ContactsInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ciQuotaUser'
--
-- * 'ciPrettyPrint'
--
-- * 'ciContact'
--
-- * 'ciUserIP'
--
-- * 'ciKey'
--
-- * 'ciOAuthToken'
--
-- * 'ciFields'
contactsInsert'
    :: Contact -- ^ 'Contact'
    -> ContactsInsert'
contactsInsert' pCiContact_ =
    ContactsInsert'
    { _ciQuotaUser = Nothing
    , _ciPrettyPrint = True
    , _ciContact = pCiContact_
    , _ciUserIP = Nothing
    , _ciKey = Nothing
    , _ciOAuthToken = Nothing
    , _ciFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
ciQuotaUser :: Lens' ContactsInsert' (Maybe Text)
ciQuotaUser
  = lens _ciQuotaUser (\ s a -> s{_ciQuotaUser = a})

-- | Returns response with indentations and line breaks.
ciPrettyPrint :: Lens' ContactsInsert' Bool
ciPrettyPrint
  = lens _ciPrettyPrint
      (\ s a -> s{_ciPrettyPrint = a})

-- | Multipart request metadata.
ciContact :: Lens' ContactsInsert' Contact
ciContact
  = lens _ciContact (\ s a -> s{_ciContact = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
ciUserIP :: Lens' ContactsInsert' (Maybe Text)
ciUserIP = lens _ciUserIP (\ s a -> s{_ciUserIP = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
ciKey :: Lens' ContactsInsert' (Maybe Key)
ciKey = lens _ciKey (\ s a -> s{_ciKey = a})

-- | OAuth 2.0 token for the current user.
ciOAuthToken :: Lens' ContactsInsert' (Maybe OAuthToken)
ciOAuthToken
  = lens _ciOAuthToken (\ s a -> s{_ciOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
ciFields :: Lens' ContactsInsert' (Maybe Text)
ciFields = lens _ciFields (\ s a -> s{_ciFields = a})

instance GoogleAuth ContactsInsert' where
        authKey = ciKey . _Just
        authToken = ciOAuthToken . _Just

instance GoogleRequest ContactsInsert' where
        type Rs ContactsInsert' = Contact
        request = requestWithRoute defReq mirrorURL
        requestWithRoute r u ContactsInsert'{..}
          = go _ciQuotaUser (Just _ciPrettyPrint) _ciUserIP
              _ciKey
              _ciOAuthToken
              _ciFields
              (Just AltJSON)
              _ciContact
          where go
                  = clientWithRoute
                      (Proxy :: Proxy ContactsInsertResource)
                      r
                      u