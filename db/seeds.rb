companies = [
  { name: 'Alaska Airlines Inc', full_address: '1 Airport Rd, Kotzebue, AK, 99752' },
  { name: 'Birch Boy Products', full_address: '18 Mile Haines Hwy, Haines, AK, 99827' },
  { name: 'Breeze Inn Motel', full_address: '1306 Seward Hwy, Seward, AK, 99664' },
  { name: 'Bristol Bay Housing Authority', full_address: '1244 Tower Rd, Dillingham, AK, 99576' },
  { name: 'CCI Inc', full_address: '100 Airport Way, Prudhoe Bay, AK, 99734' },
  { name: 'Chair 5', full_address: '171 Linblad Ave, Girdwood, AK, 99587' },
  { name: 'Davis Constructors & Engineers', full_address: '740 Bonanza Ave, Anchorage, AK, 99518' },
  { name: 'Delta Mine Training Ctr', full_address: '1596 Richardson Hwy, Delta Junction, AK, 99737' },
  { name: 'Denali Air', full_address: 'Parks Hwy Mm 229.5, Denali Natl Park, AK, 99755' },
  { name: 'Denali Manor B & B', full_address: 'Park Hwy, Cantwell, AK, 99729' },
  { name: 'Denali Rv Park & Motel', full_address: 'Mile 245.1 Parks Hwy, Healy, AK, 99755' },
  { name: 'Forty Mile Air', full_address: 'Alaska Hwy Mm 1313, Tok, AK, 99780' },
  { name: 'Frontier Flying Svc', full_address: '4700 Old Intl Airport Rd, Anchorage, AK, 99502' },
  { name: 'Glacier Bay Country Inn', full_address: '35 Tong Road, Gustavus, AK, 99826' },
  { name: "Gwin's Lodge & Restaurant", full_address: '14865 Sterling Hwy, Cooper Landing, AK, 99572' },
  { name: 'Indian Valley Meats', full_address: '200 Huot Circle
", Indian, AK, 99540' },
  { name: 'Joint Regional Environmental', full_address: '655 Richardson Dr, Fort Richardson, AK, 99505' },
  { name: 'Keex Kwaan', full_address: '538 Keku Rd, Kake, AK, 99830' },
  { name: 'Lynden Transport Inc', full_address: '326 Mitkof Hwy, Petersburg, AK, 99833' },
  { name: "NANA President's Office", full_address: 'Suite 150, 3150 C Street, Anchorage, AK, 99503' },
  { name: 'Shelter Cove Lodge', full_address: '703 Hamilton Dr, Craig, AK, 99921' },
  { name: 'Tigara Corp', full_address: '2121 Abbott Rd. Suite 202, Anchorage, AK, 99507 ' },
  { name: 'Trail Lake Lodge', full_address: '35168 Seward Hwy, Moose Pass, AK, 99631' },
  { name: 'Trident Seafoods', full_address: '303 Harbor Dr, St Paul Island, AK, 99660' }
]

companies.each do |company_attr|
  Company.create(company_attr)
end
