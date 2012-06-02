-- This file defines the target PostgreSQL schema for the ABS Census 2011 Basic
-- Community Profile.

-- This file is licensed CC0 by Andrew Harvey <andrew.harvey4@gmail.com>
--
-- To the extent possible under law, the person who associated CC0
-- with this work has waived all copyright and related or neighboring
-- rights to this work.
-- http://creativecommons.org/publicdomain/zero/1.0/
--
-- This schema is partly derived from the ABS Census 2011 Datapack Samples,
-- which are Copyright Australian Bureau of Statistics (ABS) http://abs.gov.au/,
-- Commonwealth of Australia and licensed under the CC BY 2.5 AU license
-- http://creativecommons.org/licenses/by/2.5/au/ by the ABS.
-- The datapack samples were retrieved from http://www.abs.gov.au/websitedbs/censushome.nsf/home/datapackssample/$file/2011_BCP_AU_for_AUST_short-header.zip


-- B03
CREATE TABLE census_2011.bcp_place_of_usual_residence_on_census_night_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_b(min),
  place_of_usual_residence census_2011.place_of_usual_residence,

  visitor_from_different_sa2_state_code asgs_2011.state_code REFERENCES asgs_2011.state(code),

  persons integer,

  PRIMARY KEY (asgs_code, age, place_of_usual_residence)
);

-- B04
CREATE TABLE census_2011.bcp_population_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.population_age_ranges(min),
  sex census_2011.sex,

  persons integer,

  PRIMARY KEY (asgs_code, age, sex)
);

-- B05
CREATE TABLE census_2011.bcp_registered_marital_status_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  registered_marital_status census_2011.registered_marital_status,

  persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, registered_marital_status)
);

-- B06
CREATE TABLE census_2011.bcp_social_marital_status_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  social_marital_status census_2011.social_marital_status,

  persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, social_marital_status)
);

-- B07
CREATE TABLE census_2011.bcp_indigenous_status_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_e(min),
  sex census_2011.sex,
  indigenous census_2011.yes_no_notstated,

  persons integer,

  PRIMARY KEY (asgs_code, age, sex, indigenous)
);

-- B08
CREATE TABLE census_2011.bcp_ancestry_by_birthplace_of_parents_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  ancestry census_2011.ancestry,
  parent_birthplace_combination census_2011.parent_birthplace_combination,

  persons integer,

  PRIMARY KEY (asgs_code, ancestry, parent_birthplace_combination)
);

-- B09
CREATE TABLE census_2011.bcp_country_of_birth_by_sex_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  country census_2011.birthplace,

  persons integer,

  PRIMARY KEY (asgs_code, sex, country)
);

-- B10
CREATE TABLE census_2011.bcp_country_of_birth_by_year_of_arrival_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  year_of_arrival smallint REFERENCES census_2011.year_of_arrival(code),
  country census_2011.birthplace,

  persons_born_overseas integer,

  PRIMARY KEY (asgs_code, year_of_arrival, country)
);

-- B11
CREATE TABLE census_2011.bcp_spoken_english_proficiency_by_year_of_arrival_by_sex_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  year_of_arrival smallint REFERENCES census_2011.year_of_arrival_b(code),
  sex census_2011.sex,
  proficiency census_2011.english_proficiency,

  persons_born_overseas integer,

  PRIMARY KEY (asgs_code, year_of_arrival, sex, proficiency)
);

-- B12
CREATE TABLE census_2011.bcp_spoken_english_proficiency_of_parents_by_age_of_dependent_children_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  child_age smallint REFERENCES census_2011.age_ranges_children(min),
  proficiency_male_parent census_2011.english_proficiency,
  proficiency_female_parent census_2011.english_proficiency,

  dependent_children_in_couple_families integer,

  PRIMARY KEY (asgs_code, child_age, proficiency_male_parent, proficiency_female_parent)
);

-- B13
CREATE TABLE census_2011.bcp_language_spoken_at_home_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  language census_2011.language,

  persons integer,

  PRIMARY KEY (asgs_code, sex, language)
);

-- B14
CREATE TABLE census_2011.bcp_religious_affiliation_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  religion census_2011.religion,
  denomination census_2011.religion_denomination,

  persons integer,

  PRIMARY KEY (asgs_code, sex, religion, denomination)
);

-- B15
CREATE TABLE census_2011.bcp_type_of_educational_institution_attending_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  educational_institution census_2011.educational_institution,

  persons_attending_an_educational_institution integer,

  PRIMARY KEY (asgs_code, sex, educational_institution)
);

-- B16
CREATE TABLE census_2011.bcp_highest_year_of_school_completed_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  age smallint REFERENCES census_2011.age_ranges_a(min),
  school_year census_2011.school_year,

  persons_aged_15_years_and_over_who_are_no_longer_attending_primary_or_secondary_school integer,

  PRIMARY KEY (asgs_code, sex, age, school_year)
);

-- B17
CREATE TABLE census_2011.bcp_income_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  income_band smallint REFERENCES census_2011.income_band(code),

  persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, income_band)
);

-- B18
CREATE TABLE census_2011.bcp_core_activity_need_for_assistance_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_c(min),
  sex census_2011.sex,
  need_assistance census_2011.yes_no_notstated,

  persons integer,

  PRIMARY KEY (asgs_code, age, sex, need_assistance)
);

-- B19
CREATE TABLE census_2011.bcp_volunteer_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  volunteered census_2011.yes_no_notstated,

  persons integer,

  PRIMARY KEY (asgs_code, age, sex, volunteered)
);

-- B20
CREATE TABLE census_2011.bcp_unpaid_domestic_work_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  unpaid_domestic_work_amount smallint REFERENCES census_2011.unpaid_domestic_work(code),

  persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, unpaid_domestic_work_amount)
);

-- B21
CREATE TABLE census_2011.bcp_unpaid_assistance_to_a_person_with_a_disability_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  provided_assistance census_2011.yes_no_notstated,

  persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, provided_assistance)
);

-- B22
CREATE TABLE census_2011.bcp_unpaid_child_care_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  child_care census_2011.child_care,

  persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, child_care)
);

-- B23
CREATE TABLE census_2011.bcp_relationship_in_houshold_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_b(min),
  sex census_2011.sex,
  household_relationship census_2011.household_relationship,

  persons_in_occupied_private_dwellings integer,

  PRIMARY KEY (asgs_code, age, sex, household_relationship)
);

-- B24
CREATE TABLE census_2011.bcp_number_of_children_over_born_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age_of_parent smallint REFERENCES census_2011.age_ranges_d(min),
  number_of_children_ever_born census_2011.number_of_children,

  females_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age_of_parent, number_of_children_ever_born)
);

-- B25
CREATE TABLE census_2011.bcp_family_composition_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  family_type census_2011.family_type,
  children_under_15 boolean,
  dependent_students boolean,
  non_dependent_children boolean,

  families integer,
  persons integer,

  PRIMARY KEY (asgs_code, family_type, children_under_15, dependent_students, non_dependent_children)
);

-- B26
CREATE TABLE census_2011.bcp_family_income_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  family_type census_2011.family_type,
  income_range census_2011.family_income_band,

  families integer,

  PRIMARY KEY (asgs_code, family_type, income_range)
);

-- B27
CREATE TABLE census_2011.bcp_family_blending_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  blended_family_type census_2011.blended_family_type,
  other_children_present boolean,

  families integer,

  PRIMARY KEY (asgs_code, blended_family_type, other_children_present)
);

-- B28
CREATE TABLE census_2011.bcp_household_income_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  income_range census_2011.income_band,
  family_household boolean,

  occupied_private_dwellings integer,

  PRIMARY KEY (asgs_code, income_range, family_household)
);

-- B29
CREATE TABLE census_2011.bcp_motor_vehicles_per_dwelling_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  number_of_motor_vehicles census_2011.number_of_motor_vehicles,

  occupied_private_dwellings integer,

  PRIMARY KEY (asgs_code, number_of_motor_vehicles)
);

-- B30
CREATE TABLE census_2011.bcp_number_of_persons_usually_resident_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  number_of_persons_usually_resident census_2011.number_of_persons_usually_resident,
  family_household boolean,

  persons integer,

  PRIMARY KEY (asgs_code, number_of_persons_usually_resident, family_household)
);

-- B31
CREATE TABLE census_2011.bcp_dwelling_structure_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  dwelling_structure census_2011.dwelling_structure_extended_full,

  dwellings integer,
  persons integer,

  PRIMARY KEY (asgs_code, dwelling_structure)
);

-- B32
CREATE TABLE census_2011.bcp_tenure_type_and_landlord_type_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  dwelling_structure census_2011.dwelling_structure_simple,
  tenure_landlord_type census_2011.tenure_landlord_type,

  occupied_private_dwellings integer,

  PRIMARY KEY (asgs_code, dwelling_structure, tenure_landlord_type)
);

-- B33
CREATE TABLE census_2011.bcp_mortgage_repayment_by_dwelling_structure_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  income_range census_2011.income_band,
  dwelling_structure census_2011.dwelling_structure_simple,

  occupied_private_dwellings_being_purchased integer,

  PRIMARY KEY (asgs_code, income_range, dwelling_structure)
);

-- B34
CREATE TABLE census_2011.bcp_rent_by_landlord_type_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  rent_band census_2011.rental_payment_band,
  landlord_type census_2011.landlord_type,

  occupied_private_dwellings_being_rented integer,

  PRIMARY KEY (asgs_code, rent_band, landlord_type)
);

-- B35
CREATE TABLE census_2011.bcp_internet_connection_type_by_dwelling_structure_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  dwelling_structure census_2011.dwelling_structure_simple,
  internet_connection census_2011.internet_connection,

  occupied_private_dwellings integer,

  PRIMARY KEY (asgs_code, dwelling_structure, internet_connection)
);

-- B36
CREATE TABLE census_2011.bcp_dwelling_structure_by_number_of_bedrooms_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  dwelling_structure census_2011.dwelling_structure_extended_minimal,
  number_of_bedrooms census_2011.number_of_bedrooms,

  occupied_private_dwellings integer,

  PRIMARY KEY (asgs_code, dwelling_structure, number_of_bedrooms)
);


-- B38, B39
CREATE TABLE census_2011.bcp_previous_place_of_usual_residence_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  one_year_ago boolean, -- true = 1yr, false = 5yr
  previous_place_of_usual_residence census_2011.previous_place_of_usual_residence,

  different_usual_address_different_sa2_state_code asgs_2011.state_code REFERENCES asgs_2011.state(code),

  persons integer,

  PRIMARY KEY (asgs_code, sex, one_year_ago, previous_place_of_usual_residence)
);

-- B40
CREATE TABLE census_2011.bcp_non_school_qualification_level_of_education_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  non_school_level_of_education census_2011.non_school_level_of_education,

  persons_aged_15_years_and_over_with_a_qualification integer,

  PRIMARY KEY (asgs_code, age, sex, non_school_level_of_education)
);

-- B41
CREATE TABLE census_2011.bcp_non_school_qualification_field_of_study_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  field_of_study census_2011.field_of_study,

  persons_aged_15_years_and_over_with_a_qualification integer,

  PRIMARY KEY (asgs_code, age, sex, field_of_study)
);

-- B42
CREATE TABLE census_2011.bcp_labour_force_status_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  employment_status census_2011.employment_status,

  employed_persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, employment_status)
);

-- B43
CREATE TABLE census_2011.bcp_industry_of_employment_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  industry census_2011.industry,

  employed_persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, industry)
);

-- B44
CREATE TABLE census_2011.bcp_industry_of_employment_by_occupation_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  industry census_2011.industry,
  occupation census_2011.occupation,
  
  employed_persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, industry, occupation)
);

-- B45
CREATE TABLE census_2011.bcp_occupation_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  age smallint REFERENCES census_2011.age_ranges_a(min),
  sex census_2011.sex,
  occupation census_2011.occupation,

  employed_persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, age, sex, occupation)
);

-- B46
CREATE TABLE census_2011.bcp_method_of_travel_to_work_{structure}
(
  asgs_code asgs_2011.{structure}_code REFERENCES asgs_2011.{structure}(code),
  sex census_2011.sex,
  method_of_travel census_2011.method_of_travel,

  employed_persons_aged_15_years_and_over integer,

  PRIMARY KEY (asgs_code, sex, method_of_travel)
);