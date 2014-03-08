def stub_general_create
  WickedWiki.protections["general"].stub(:[]).with(:new).and_return(:ww_user_signed_in?)
end
