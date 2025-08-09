module StateHelper
  STATES = {
    'Alabama' => 'AL',
    'Alaska' => 'AK',
    'Arizona' => 'AZ',
    'Arkansas' => 'AR',
    'California' => 'CA',
    'Colorado' => 'CO',
    'Connecticut' => 'CT',
    'Delaware' => 'DE',
    'District of Columbia' => 'DC',
    'Florida' => 'FL',
    'Georgia' => 'GA',
    'Hawaii' => 'HI',
    'Idaho' => 'ID',
    'Illinois' => 'IL',
    'Indiana' => 'IN',
    'Iowa' => 'IA',
    'Kansas' => 'KS',
    'Kentucky' => 'KY',
    'Louisiana' => 'LA',
    'Maine' => 'ME',
    'Maryland' => 'MD',
    'Massachusetts' => 'MA',
    'Michigan' => 'MI',
    'Minnesota' => 'MN',
    'Mississippi' => 'MS',
    'Missouri' => 'MO',
    'Montana' => 'MT',
    'Nebraska' => 'NE',
    'Nevada' => 'NV',
    'New Hampshire' => 'NH',
    'New Jersey' => 'NJ',
    'New Mexico' => 'NM',
    'New York' => 'NY',
    'North Carolina' => 'NC',
    'North Dakota' => 'ND',
    'Ohio' => 'OH',
    'Oklahoma' => 'OK',
    'Oregon' => 'OR',
    'Pennsylvania' => 'PA',
    'Rhode Island' => 'RI',
    'South Carolina' => 'SC',
    'South Dakota' => 'SD',
    'Tennessee' => 'TN',
    'Texas' => 'TX',
    'Utah' => 'UT',
    'Vermont' => 'VT',
    'Virginia' => 'VA',
    'Washington' => 'WA',
    'West Virginia' => 'WV',
    'Wisconsin' => 'WI',
    'Wyoming' => 'WY'
  }.freeze

  # Simple nearby states mapping based on geographic proximity
  NEARBY_STATES = {
    'AL' => %w[FL GA TN MS],
    'AK' => %w[WA OR CA],
    'AZ' => %w[CA NV UT NM CO],
    'AR' => %w[LA MS TN MO OK TX],
    'CA' => %w[NV AZ OR WA],
    'CO' => %w[WY NE KS OK NM UT],
    'CT' => %w[MA RI NY],
    'DE' => %w[MD PA NJ],
    'DC' => %w[MD VA],
    'FL' => %w[GA AL],
    'GA' => %w[FL AL TN NC SC],
    'HI' => %w[CA AK],
    'ID' => %w[MT WY UT NV OR WA],
    'IL' => %w[IN WI IA MO KY],
    'IN' => %w[IL MI OH KY],
    'IA' => %w[MN WI IL MO KS NE SD],
    'KS' => %w[NE MO OK CO],
    'KY' => %w[IN IL MO TN VA WV OH],
    'LA' => %w[TX AR MS],
    'ME' => %w[NH VT MA],
    'MD' => %w[PA WV VA DE DC],
    'MA' => %w[RI CT NY VT NH ME],
    'MI' => %w[OH IN WI],
    'MN' => %w[WI IA SD ND],
    'MS' => %w[LA AR TN AL],
    'MO' => %w[IA IL KY TN AR OK KS NE],
    'MT' => %w[ND SD WY ID],
    'NE' => %w[SD IA MO KS CO WY],
    'NV' => %w[ID UT AZ CA OR],
    'NH' => %w[ME VT MA],
    'NJ' => %w[NY PA DE],
    'NM' => %w[CO OK TX AZ UT],
    'NY' => %w[VT MA CT NJ PA],
    'NC' => %w[VA TN GA SC],
    'ND' => %w[MN SD MT],
    'OH' => %w[PA WV KY IN MI],
    'OK' => %w[KS AR TX NM CO],
    'OR' => %w[WA ID NV CA],
    'PA' => %w[NY NJ DE MD WV OH],
    'RI' => %w[CT MA],
    'SC' => %w[NC GA],
    'SD' => %w[ND MN IA NE WY MT],
    'TN' => %w[KY VA NC GA AL MS AR MO],
    'TX' => %w[NM OK AR LA],
    'UT' => %w[ID WY CO NM AZ NV],
    'VT' => %w[NH MA NY],
    'VA' => %w[MD WV KY TN NC DC],
    'WA' => %w[ID OR],
    'WV' => %w[OH PA MD VA KY],
    'WI' => %w[MI MN IA IL],
    'WY' => %w[MT SD NE CO UT ID]
  }.freeze

  def self.normalize_state_input(input)
    return nil if input.blank?
    
    input = input.strip.downcase
    
    # Try exact match on abbreviation
    abbrev_match = STATES.values.find { |abbr| abbr.downcase == input }
    return abbrev_match if abbrev_match
    
    # Try exact match on full name
    name_match = STATES.find { |name, _| name.downcase == input }
    return name_match[1] if name_match
    
    # Try partial match on full name
    partial_match = STATES.find { |name, _| name.downcase.include?(input) }
    return partial_match[1] if partial_match
    
    nil
  end

  def self.get_nearby_states(state_abbr, max_depth = 5)
    return [] unless state_abbr && NEARBY_STATES[state_abbr.upcase]
    
    nearby = []
    current_level = [state_abbr.upcase]
    visited = Set.new([state_abbr.upcase])
    
    max_depth.times do
      next_level = []
      current_level.each do |state|
        NEARBY_STATES[state]&.each do |neighbor|
          unless visited.include?(neighbor)
            nearby << neighbor
            next_level << neighbor
            visited.add(neighbor)
          end
        end
      end
      break if next_level.empty?
      current_level = next_level
    end
    
    nearby
  end

  def self.state_list_for_autocomplete
    (STATES.keys + STATES.values).uniq.sort
  end
end