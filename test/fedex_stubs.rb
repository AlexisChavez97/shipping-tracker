# frozen_string_literal: true

module FedexStubs
  def stub_request_for_get_delivery_status
    stub_request(:post, "https://wsbeta.fedex.com/xml/").
    with(
      body: "<TrackRequest xmlns=\"http://fedex.com/ws/track/v6\">\n  <WebAuthenticationDetail>\n    <UserCredential>\n      <Key>O21wEWKhdDn2SYyb</Key>\n      <Password>db0SYxXWWh0bgRSN7Ikg9Vunz</Password>\n    </UserCredential>\n  </WebAuthenticationDetail>\n  <ClientDetail>\n    <AccountNumber>510087780</AccountNumber>\n    <MeterNumber>119009727</MeterNumber>\n    <Localization>\n      <LanguageCode>en</LanguageCode>\n      <LocaleCode>us</LocaleCode>\n    </Localization>\n  </ClientDetail>\n  <Version>\n    <ServiceId>trck</ServiceId>\n    <Major>6</Major>\n    <Intermediate>0</Intermediate>\n    <Minor>0</Minor>\n  </Version>\n  <PackageIdentifier>\n    <Value>12345678901234</Value>\n    <Type>TRACKING_NUMBER_OR_DOORTAG</Type>\n  </PackageIdentifier>\n  <IncludeDetailedScans>true</IncludeDetailedScans>\n</TrackRequest>",
      headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "", headers: {})
  end
end