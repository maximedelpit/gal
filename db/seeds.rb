# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
ProspectArea.destroy_all
IndustrySubcategory.destroy_all
Industry.destroy_all
puts 'Deleted data'

industry_data = [{name: "Accounting", linkedin_code: "47"},
{name: "Airlines/Aviation", linkedin_code: "94"},
{name: "Alternative Dispute Resolution", linkedin_code: "120"},
{name: "Alternative Medicine", linkedin_code: "125"},
{name: "Animation", linkedin_code: "127"},
{name: "Apparel & Fashion", linkedin_code: "19"},
{name: "Architecture & Planning", linkedin_code: "50"},
{name: "Arts & Crafts", linkedin_code: "111"},
{name: "Automotive", linkedin_code: "53"},
{name: "Aviation & Aerospace", linkedin_code: "52"},
{name: "Banking", linkedin_code: "41"},
{name: "Biotechnology", linkedin_code: "12"},
{name: "Broadcast Media", linkedin_code: "36"},
{name: "Building Materials", linkedin_code: "49"},
{name: "Business Supplies & Equipment", linkedin_code: "138"},
{name: "Capital Markets", linkedin_code: "129"},
{name: "Chemicals", linkedin_code: "54"},
{name: "Civic & Social Organization", linkedin_code: "90"},
{name: "Civil Engineering", linkedin_code: "51"},
{name: "Commercial Real Estate", linkedin_code: "128"},
{name: "Computer & Network Security", linkedin_code: "118"},
{name: "Computer Games", linkedin_code: "109"},
{name: "Computer Hardware", linkedin_code: "3"},
{name: "Computer Networking", linkedin_code: "5"},
{name: "Computer Software", linkedin_code: "4"},
{name: "Construction", linkedin_code: "48"},
{name: "Consumer Electronics", linkedin_code: "24"},
{name: "Consumer Goods", linkedin_code: "25"},
{name: "Consumer Services", linkedin_code: "91"},
{name: "Cosmetics", linkedin_code: "18"},
{name: "Dairy", linkedin_code: "65"},
{name: "Defense & Space", linkedin_code: "1"},
{name: "Design", linkedin_code: "99"},
{name: "Education Management", linkedin_code: "69"},
{name: "E-Learning", linkedin_code: "132"},
{name: "Electrical/Electronic Manufacturing", linkedin_code: "112"},
{name: "Entertainment", linkedin_code: "28"},
{name: "Environmental Services", linkedin_code: "86"},
{name: "Events Services", linkedin_code: "110"},
{name: "Executive Office", linkedin_code: "76"},
{name: "Facilities Services", linkedin_code: "122"},
{name: "Farming", linkedin_code: "63"},
{name: "Financial Services", linkedin_code: "43"},
{name: "Fine Art", linkedin_code: "38"},
{name: "Fishery", linkedin_code: "66"},
{name: "Food & Beverages", linkedin_code: "34"},
{name: "Food Production", linkedin_code: "23"},
{name: "Fund-Raising", linkedin_code: "101"},
{name: "Furniture", linkedin_code: "26"},
{name: "Gambling & Casinos", linkedin_code: "29"},
{name: "Glass, Ceramics & Concrete", linkedin_code: "145"},
{name: "Government Administration", linkedin_code: "75"},
{name: "Government Relations", linkedin_code: "148"},
{name: "Graphic Design", linkedin_code: "140"},
{name: "Health, Wellness & Fitness", linkedin_code: "124"},
{name: "Higher Education", linkedin_code: "68"},
{name: "Hospital & Health Care", linkedin_code: "14"},
{name: "Hospitality", linkedin_code: "31"},
{name: "Human Resources", linkedin_code: "137"},
{name: "Import & Export", linkedin_code: "134"},
{name: "Individual & Family Services", linkedin_code: "88"},
{name: "Industrial Automation", linkedin_code: "147"},
{name: "Information Services", linkedin_code: "84"},
{name: "Information Technology & Services", linkedin_code: "96"},
{name: "Insurance", linkedin_code: "42"},
{name: "International Affairs", linkedin_code: "74"},
{name: "International Trade & Development", linkedin_code: "141"},
{name: "Internet", linkedin_code: "6"},
{name: "Investment Banking", linkedin_code: "45"},
{name: "Investment Management", linkedin_code: "46"},
{name: "Judiciary", linkedin_code: "73"},
{name: "Law Enforcement", linkedin_code: "77"},
{name: "Law Practice", linkedin_code: "9"},
{name: "Legal Services", linkedin_code: "10"},
{name: "Legislative Office", linkedin_code: "72"},
{name: "Leisure, Travel & Tourism", linkedin_code: "30"},
{name: "Libraries", linkedin_code: "85"},
{name: "Logistics & Supply Chain", linkedin_code: "116"},
{name: "Luxury Goods & Jewelry", linkedin_code: "143"},
{name: "Machinery", linkedin_code: "55"},
{name: "Management Consulting", linkedin_code: "11"},
{name: "Maritime", linkedin_code: "95"},
{name: "Market Research", linkedin_code: "97"},
{name: "Marketing & Advertising", linkedin_code: "80"},
{name: "Mechanical or Industrial Engineering", linkedin_code: "135"},
{name: "Media Production", linkedin_code: "126"},
{name: "Medical Devices", linkedin_code: "17"},
{name: "Medical Practice", linkedin_code: "13"},
{name: "Mental Health Care", linkedin_code: "139"},
{name: "Military", linkedin_code: "71"},
{name: "Mining & Metals", linkedin_code: "56"},
{name: "Motion Pictures & Film", linkedin_code: "35"},
{name: "Museums & Institutions", linkedin_code: "37"},
{name: "Music", linkedin_code: "115"},
{name: "Nanotechnology", linkedin_code: "114"},
{name: "Newspapers", linkedin_code: "81"},
{name: "Non-Profit Organization Management", linkedin_code: "100"},
{name: "Oil & Energy", linkedin_code: "57"},
{name: "Online Media", linkedin_code: "113"},
{name: "Outsourcing/Offshoring", linkedin_code: "123"},
{name: "Package/Freight Delivery", linkedin_code: "87"},
{name: "Packaging & Containers", linkedin_code: "146"},
{name: "Paper & Forest Products", linkedin_code: "61"},
{name: "Performing Arts", linkedin_code: "39"},
{name: "Pharmaceuticals", linkedin_code: "15"},
{name: "Philanthropy", linkedin_code: "131"},
{name: "Photography", linkedin_code: "136"},
{name: "Plastics", linkedin_code: "117"},
{name: "Political Organization", linkedin_code: "107"},
{name: "Primary/Secondary Education", linkedin_code: "67"},
{name: "Printing", linkedin_code: "83"},
{name: "Professional Training & Coaching", linkedin_code: "105"},
{name: "Program Development", linkedin_code: "102"},
{name: "Public Policy", linkedin_code: "79"},
{name: "Public Relations & Communications", linkedin_code: "98"},
{name: "Public Safety", linkedin_code: "78"},
{name: "Publishing", linkedin_code: "82"},
{name: "Railroad Manufacture", linkedin_code: "62"},
{name: "Ranching", linkedin_code: "64"},
{name: "Real Estate", linkedin_code: "44"},
{name: "Recreational Facilities & Services", linkedin_code: "40"},
{name: "Religious Institutions", linkedin_code: "89"},
{name: "Renewables & Environment", linkedin_code: "144"},
{name: "Research", linkedin_code: "70"},
{name: "Restaurants", linkedin_code: "32"},
{name: "Retail", linkedin_code: "27"},
{name: "Security & Investigations", linkedin_code: "121"},
{name: "Semiconductors", linkedin_code: "7"},
{name: "Shipbuilding", linkedin_code: "58"},
{name: "Sporting Goods", linkedin_code: "20"},
{name: "Sports", linkedin_code: "33"},
{name: "Staffing & Recruiting", linkedin_code: "104"},
{name: "Supermarkets", linkedin_code: "22"},
{name: "Telecommunications", linkedin_code: "8"},
{name: "Textiles", linkedin_code: "60"},
{name: "Think Tanks", linkedin_code: "130"},
{name: "Tobacco", linkedin_code: "21"},
{name: "Translation & Localization", linkedin_code: "108"},
{name: "Transportation/Trucking/Railroad", linkedin_code: "92"},
{name: "Utilities", linkedin_code: "59"},
{name: "Venture Capital & Private Equity", linkedin_code: "106"},
{name: "Veterinary", linkedin_code: "16"},
{name: "Warehousing", linkedin_code: "93"},
{name: "Wholesale", linkedin_code: "133"},
{name: "Wine & Spirits", linkedin_code: "142"},
{name: "Wireless", linkedin_code: "119"},
{name: "Writing & Editing", linkedin_code: "103"}]

industry_data.each {|ind| Industry.create!(ind)}
puts 'Industries created'

ind_subcats = ["Advertising Business", "Benefits management", "Digital Marketing", "Employer liability management",
  "Employment administration", "Government compliance reporting and agency interface",
  "Graphics & Design", "Miscllenaous(HR)", "Miscllenaous(marekting)", "Performance management support",
  "Programming & Tech", "Recruiting and outplacement support", "Retirement services",
  "Training and development", "Transportation", "Travel and Leisure", "Vehicle Maintenance",
  "Video & Animation", "Writing & Translation"]

ind_subcats.each {|s| IndustrySubcategory.create!(name: s, validated: true)}
puts 'IndustrySubcats created'

sub_keys = [
  ["Graphics & Design", "Logo Design"],
  ["Graphics & Design", "Business Cards & StationeryIllustration"],
  ["Graphics & Design", "Cartoons & Caricatures"],
  ["Graphics & Design", "Flyers & Posters"],
  ["Graphics & Design", "Book Covers & Packaging"],
  ["Graphics & Design", "Web & Mobile Design"],
  ["Graphics & Design", "Social Media Design"],
  ["Graphics & Design", "Banner Ads"],
  ["Graphics & Design", "Photoshop Editing"],
  ["Graphics & Design", "3D & 2D Models"],
  ["Graphics & Design", "T-Shirts"],
  ["Graphics & Design", "Presentation Design"],
  ["Graphics & Design", "Infographics"],
  ["Graphics & Design", "Vector Tracing"],
  ["Graphics & Design", "Invitations"],
  ["Digital Marketing", "Social Media Marketing"],
  ["Digital Marketing", "SEO"],
  ["Digital Marketing", "Web Traffic"],
  ["Digital Marketing", "Content Marketing"],
  ["Digital Marketing", "Video Advertising"],
  ["Digital Marketing", "Email Marketing"],
  ["Digital Marketing", "SEMMarketing"],
  ["Digital Marketing", "StrategyWeb Analytics"],
  ["Digital Marketing", "Influencer Marketing"],
  ["Digital Marketing", "Local Listings"],
  ["Digital Marketing", "Domain Research"],
  ["Digital Marketing", "Mobile Advertising"],
  ["Writing & Translation", "Resumes & Cover Letters"],
  ["Writing & Translation", "Proofreading & Editing"],
  ["Writing & Translation", "TranslationCreative Writing"],
  ["Writing & Translation", "Business Copywriting"],
  ["Writing & Translation", "Research & Summaries"],
  ["Writing & Translation", "Articles & Blog Posts"],
  ["Writing & Translation", "Press Releases"],
  ["Writing & Translation", "Transcription"],
  ["Writing & Translation", "Legal Writing"],
  ["Video & Animation", "Whiteboard & Explainer Videos"],
  ["Video & Animation", "Intros & Animated Logos"],
  ["Video & Animation", "Promotional & Brand Videos"],
  ["Video & Animation", "Editing & Post Production"],
  ["Video & Animation", "Lyric & Music Videos"],
  ["Video & Animation", "Spokespersons & Testimonials"],
  ["Video & Animation", "Animated Characters & Modelling"],
  ["Video & Animation", "Video Greetings"],
  ["Programming & Tech", "WordPress"],
  ["Programming & Tech", "Website Builders & CMS"],
  ["Programming & Tech", "Web Programming"],
  ["Programming & Tech", "Ecommerce"],
  ["Programming & Tech", "Mobile Apps & WebDesktop applications"],
  ["Programming & Tech", "Support & IT"],
  ["Programming & Tech", "Data Analysis & Reports"],
  ["Programming & Tech", "Convert Files"],
  ["Programming & Tech", "Databases"],
  ["Programming & Tech", "User Testing"],
  ["Programming & Tech", "QA"],
  ["Advertising Business", "Music Promotion"],
  ["Advertising Business", "Radio"],
  ["Advertising Business", "Banner Advertising"],
  ["Advertising Business", "Outdoor Advertising"],
  ["Advertising Business", "Flyers & Handouts"],
  ["Advertising Business", "Hold Your SignHuman Billboards"],
  ["Miscellaneous(marketing)", "Virtual Assistant"],
  ["Miscellaneous(marketing)", "Market Research"],
  ["Miscellaneous(marketing)", "Business Plans"],
  ["Miscellaneous(marketing)", "Branding Services"],
  ["Miscellaneous(marketing)", "Legal Consulting"],
  ["Miscellaneous(marketing)", "Financial Consulting"],
  ["Miscellaneous(marketing)", "Business TipsPresentations"],
  ["Miscellaneous(marketing)", "Career Advice"],
  ["Miscellaneous(marketing)", "Souvenirs for businesses"],
  ["Miscellaneous(marketing)", "Freight & Shipping Services"],
  ["Miscellaneous(marketing)", "Accounting"],
  ["Miscellaneous(marketing)", "Architecture & Planning"],
  ["Miscellaneous(marketing)", "Business Supplies and Equipment"],
  ["Miscellaneous(marketing)", "Cleaning"],
  ["Miscellaneous(marketing)", "Customer Support Services"],
  ["Miscellaneous(marketing)", "HR & Recruitment Services"],
  ["Miscellaneous(marketing)", "Business security"],
  ["Miscellaneous(marketing)", "Import & Export"],
  ["Miscellaneous(marketing)", "LogisticsInsurance"],
  ["Miscellaneous(HR)", "HR Support Package"],
  ["Miscellaneous(HR)", "Supervisor Training"],
  ["Miscellaneous(HR)", "HR Compliance Review"],
  ["Miscellaneous(HR)", "Compensation Plan Design"],
  ["Miscellaneous(HR)", "Performance Management Systems"],
  ["Miscellaneous(HR)", "Compliance Basics Plus SPD & POP"],
  ["Miscellaneous(HR)", "Absence &Leave Management"],
  ["Miscellaneous(HR)", "Applicant Tracking & Management0"],
  ["Miscellaneous(HR)", "Benefits Administration"],
  ["Miscellaneous(HR)", "Compensation Management"],
  ["Miscellaneous(HR)", "Digital & Video Interview"],
  ["Miscellaneous(HR)", "Employee Recognition"],
  ["Miscellaneous(HR)", "Employee Scheduling"],
  ["Miscellaneous(HR)", "Expense Management & Report"],
  ["Miscellaneous(HR)", "Freelance & Contractors"],
  ["Miscellaneous(HR)", "Services"],
  ["Miscellaneous(HR)", "HR Core"],
  ["Miscellaneous(HR)", "Job Board & Advertisement"],
  ["Miscellaneous(HR)", "Mentoring"],
  ["Miscellaneous(HR)", "Onboarding & Offboarding"],
  ["Miscellaneous(HR)", "Payroll"],
  ["Miscellaneous(HR)", "Performance Management & Appraisal"],
  ["Miscellaneous(HR)", "Recruiting"],
  ["Miscellaneous(HR)", "Talent Management & Personal Development"],
  ["Miscellaneous(HR)", "Time Clock, Recording & Attendance"],
  ["Miscellaneous(HR)", "Training & e-Learning"],
  ["Miscellaneous(HR)", "Workforce & Resource Management"],
  ["Miscellaneous(HR)", "Bookkeeping & Accounting"],
  ["Miscellaneous(HR)", "Employment Screening"],
  ["Miscellaneous(HR)", "Expense Management"],
  ["Miscellaneous(HR)", "Human Capital Consulting"],
  ["Miscellaneous(HR)", "Insurance Services"],
  ["Miscellaneous(HR)", "Organizational Planning"],
  ["Miscellaneous(HR)", "Payroll & Human Capital Management"],
  ["Miscellaneous(HR)", "Performance Management"],
  ["Miscellaneous(HR)", "Recruiting Services"],
  ["Miscellaneous(HR)", "Retirement Services"],
  ["Miscellaneous(HR)", "Time and Attendance"],
  ["Benefits management", "Health care coverage: medical, dental and vision"],
  ["Benefits management", "Flexible Spending Account plan"],
  ["Benefits management", "Life insurance and personal accident insurance"],
  ["Benefits management", "Short-term and long-term disability insurance"],
  ["Benefits management", "Adoption assistance"],
  ["Benefits management", "Commuter benefits"],
  ["Employment administration", "Payroll processing"],
  ["Employment administration", "Payroll record maintenance and management"],
  ["Employment administration", "Payroll compliance"],
  ["Employment administration", "Online paystubs and W-2s"],
  ["Employment administration", "Payroll management reports"],
  ["Employment administration", "Garnishment and deduction administration"],
  ["Employment administration", "Employment verification"],
  ["Employment administration", "PTO accruals"],
  ["Retirement services", "Comprehensive recordkeeping and plan administration."],
  ["Retirement services", "Complete payroll integration"],
  ["Retirement services", "Online access for easy enrollment, transfers and changes"],
  ["Retirement services", "Employee engagement programs and retirement readiness tools"],
  ["Retirement services", "A service team that averages 15 years of industry experience"],
  ["Retirement services", "Low participant fees"],
  ["Performance management support", "Performance appraisals"],
  ["Performance management support", "Compensation resources and tools"],
  ["Performance management support", "Supervisor coaching"],
  ["Performance management support", "Job descriptions"],
  ["Performance management support", "Base pay structures"],
  ["Performance management support", "Client self-help tools and worksheets for variable and sales compensation structures"],
  ["Performance management support", "Company climate surveys"],
  ["Government compliance reporting and agency interface", "Unemployment claims administration"],
  ["Government compliance reporting and agency interface", "FICA, FUTA, SUTA"],
  ["Government compliance reporting and agency interface", "Safety services"],
  ["Government compliance reporting and agency interface", "Drug-free policies and/or administration"],
  ["Government compliance reporting and agency interface", "EEOC administration"],
  ["Government compliance reporting and agency interface", "Job classification review"],
  ["Government compliance reporting and agency interface", "Health care reform compliance"],
  ["Employer liability management", "Workers' compensation plan coverage and claim resolution"],
  ["Employer liability management", "Employment practices liability insurance"],
  ["Employer liability management", "Safety review"],
  ["Employer liability management", "Employee handbooks"],
  ["Employer liability management", "Termination assistance"],
  ["Employer liability management", "Employee relations"],
  ["Employer liability management", "Substance abuse prevention"],
  ["Employer liability management", "Liability management training"],
  ["Training and development", "Live, virtual training"],
  ["Training and development", "Leadership development"],
  ["Training and development", "Learning management system"],
  ["Miscellaneous(HR)", "Employee communications"],
  ["Miscellaneous(HR)", "Integration between Quickbooks®and payroll data"],
  ["Recruiting and outplacement support", "Job description development"],
  ["Recruiting and outplacement support", "Wage and salary surveys"],
  ["Recruiting and outplacement support", "Process review"],
  ["Recruiting and outplacement support", "Interviewing and selection training"],
  ["Recruiting and outplacement support", "Online interviewing and selection training"],
  ["Vehicle Maintenance", "Cars &Trucks"],
  ["Vehicle Maintenance", "Motorcycles"],
  ["Vehicle Maintenance", "Other Vehicles"],
  ["Vehicle Maintenance", "Seamanship"],
  ["Vehicle Maintenance", "Trucks&Machinery"],
  ["Transportation", "Moving"],
  ["Transportation", "Package & Parcel Delivery"],
  ["Transportation", "Passenger Services"],
  ["Transportation", "Towing Services"],
  ["Travel and Leisure", "Car Rental"],
  ["Travel and Leisure", "Cruises"],
  ["Travel and Leisure", "Lodging"],
  ["Travel and Leisure", "Tours"],
  ["Travel and Leisure", "Travel Packs"],
  ["Travel and Leisure", "Travellers Assistance"],
  ["Travel and Leisure", "Hotel booking"],
  ["Travel and Leisure", "Corporate events"],
  ["Travel and Leisure", "Travel Expense management software"],
  ["Travel and Leisure", "B2B TRAVEL PORTAL"],
  ["Travel and Leisure", "WHITE LABEL SOLUTION"],
  ["Travel and Leisure", "XML/XMI SOLUTION"],
  ["Travel and Leisure", "GDS SOLUTION"],
  ["Travel and Leisure", "ANALYTICS SERVICES"],
  ["Travel and Leisure", "Air Tickets (Domestic & International)"],
  ["Travel and Leisure", "Bus Ticketing"],
  ["Travel and Leisure", "Hotel Booking"],
  ["Travel and Leisure", "Railway Ticketing"],
  ["Travel and Leisure", "Travel management consulting"],
]

sub_key_hash = {}
sub_keys.each do |k, v|
  sub_key_hash[k].present? ? sub_key_hash[k] << v : sub_key_hash[k] = [v]
end

sub_key_hash.each do |k, v|
  subcat = IndustrySubcategory.where(name: k).first_or_create(validated: true)
  subcat.tag_list = v
  subcat.save
end
puts 'IndustrySubcats keywords created'


prospect_areas = [
  {country: "France", region: nil, department: nil, zipcode: nil, category: "Country"},
  {country: "Germany", region: nil, department: nil, zipcode: nil, category: "Country"},
  {country: "Belgium", region: nil, department: nil, zipcode: nil, category: "Country"},
  {country: "Belgium", region: "Brussels", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Wallonia", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Flanders", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Walloon Brabant", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Hainaut", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Liège", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Luxemburg", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Namur", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Antwerp", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Limburg", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "East Flanders", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "West Flanders", department: nil, zipcode: nil, category: "Region"},
  {country: "Belgium", region: "Flemish Brabant", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Bourgogne - Franche-Comté ", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Nouvelle Aquitaine", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Normandie", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Grand Est", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Occitanie", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Hauts-de-France", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Auvergne - Rhône-Alpes", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Bretagne", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Centre - Val de Loire", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Corse", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Pays de la Loire", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Provence - Alpes - Côte d'Azur", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Île-de-France", department: nil, zipcode: nil, category: "Region"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "1 - Ain", category: "Department"},
  {country: "France", region: "Hauts-de-France", department: "2 - Aisne", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "3 - Allier", category: "Department"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur", department: "4 - Alpes-de-Haute-Provence", category: "Department"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur", department: "5 - Hautes-Alpes", category: "Department"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur", department: "6 - Alpes-Maritimes", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "7 - Ardèche", category: "Department"},
  {country: "France", region: "Grand Est", department: "8 - Ardennes", category: "Department"},
  {country: "France", region: "Occitanie", department: "9 - Ariège", category: "Department"},
  {country: "France", region: "Grand Est", department: "10 - Aube", category: "Department"},
  {country: "France", region: "Occitanie", department: "11 - Aude", category: "Department"},
  {country: "France", region: "Occitanie", department: "12 - Aveyron", category: "Department"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur", department: "13 - Bouches-du-Rhône", category: "Department"},
  {country: "France", region: "Normandie", department: "14 - Calvados", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "15 - Cantal", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "16 - Charente", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "17 - Charente-Maritime", category: "Department"},
  {country: "France", region: "Centre-Val de Loire", department: "18 - Cher", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "19 - Corrèze", category: "Department"},
  {country: "France", region: "Corse", department: "2A Corse-du-Sud", category: "Department"},
  {country: "France", region: "Corse", department: "2B-Haute-Corse", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "21 - Côte-d'Or", category: "Department"},
  {country: "France", region: "Bretagne", department: "22 - Côtes-d'Armor", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "23 - Creuse", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "24 - Dordogne", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "25 - Doubs", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "26 - Drôme", category: "Department"},
  {country: "France", region: "Normandie", department: "27 - Eure", category: "Department"},
  {country: "France", region: "Centre-Val de Loire", department: "28 - Eure-et-Loir", category: "Department"},
  {country: "France", region: "Bretagne", department: "29 - Finistère", category: "Department"},
  {country: "France", region: "Occitanie", department: "30 - Gard", category: "Department"},
  {country: "France", region: "Occitanie", department: "31 - Haute-Garonne", category: "Department"},
  {country: "France", region: "Occitanie", department: "32 - Gers", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "33 - Gironde", category: "Department"},
  {country: "France", region: "Occitanie", department: "34 - Hérault", category: "Department"},
  {country: "France", region: "Bretagne", department: "35 - Ille-et-Vilaine", category: "Department"},
  {country: "France", region: "Centre-Val de Loire", department: "36 - Indre", category: "Department"},
  {country: "France", region: "Centre-Val de Loire", department: "37 - Indre-et-Loire", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "38 - Isère", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "39 - Jura", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "40 - Landes", category: "Department"},
  {country: "France", region: "Centre-Val de Loire", department: "41 - Loir-et-Cher", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "42 - Loire", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "43 - Haute-Loire", category: "Department"},
  {country: "France", region: "Pays de la Loire", department: "44 - Loire-Atlantique", category: "Department"},
  {country: "France", region: "Centre-Val de Loire", department: "45 - Loiret", category: "Department"},
  {country: "France", region: "Occitanie", department: "46 - Lot", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "47 - Lot-et-Garonne", category: "Department"},
  {country: "France", region: "Occitanie", department: "48 - Lozère", category: "Department"},
  {country: "France", region: "Pays de la Loire", department: "49 - Maine-et-Loire", category: "Department"},
  {country: "France", region: "Normandie", department: "50 - Manche", category: "Department"},
  {country: "France", region: "Grand Est", department: "51 - Marne", category: "Department"},
  {country: "France", region: "Grand Est", department: "52 - Haute-Marne", category: "Department"},
  {country: "France", region: "Pays de la Loire", department: "53 - Mayenne", category: "Department"},
  {country: "France", region: "Grand Est", department: "54 - Meurthe-et-Moselle", category: "Department"},
  {country: "France", region: "Grand Est", department: "55 - Meuse", category: "Department"},
  {country: "France", region: "Bretagne", department: "56 - Morbihan", category: "Department"},
  {country: "France", region: "Grand Est", department: "57 - Moselle", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "58 - Nièvre", category: "Department"},
  {country: "France", region: "Hauts-de-France", department: "59 - Nord", category: "Department"},
  {country: "France", region: "Hauts-de-France", department: "60 - Oise", category: "Department"},
  {country: "France", region: "Normandie", department: "61 - Orne", category: "Department"},
  {country: "France", region: "Hauts-de-France", department: "62 - Pas-de-Calais", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "63 - Puy-de-Dôme", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "64 - Pyrénées-Atlantiques", category: "Department"},
  {country: "France", region: "Occitanie", department: "65 - Hautes-Pyrénées", category: "Department"},
  {country: "France", region: "Occitanie", department: "66 - Pyrénées-Orientales", category: "Department"},
  {country: "France", region: "Grand Est", department: "67 - Bas-Rhin", category: "Department"},
  {country: "France", region: "Grand Est", department: "68 - Haut-Rhin", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "69 - Circonscription départementale du Rhône", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "70 - Haute - Saône", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "71 - Saône-et-Loire", category: "Department"},
  {country: "France", region: "Pays de la Loire", department: "72 - Sarthe", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "73 - Savoie", category: "Department"},
  {country: "France", region: "Auvergne-Rhône-Alpes", department: "74 - Haute-Savoie", category: "Department"},
  {country: "France", region: "Île-de-France", department: "75 - Paris", category: "Department"},
  {country: "France", region: "Normandie", department: "76 - Seine-Maritime", category: "Department"},
  {country: "France", region: "Île-de-France", department: "77 - Seine-et-Marne", category: "Department"},
  {country: "France", region: "Île-de-France", department: "78 - Yvelines", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "79 - Deux-Sèvres", category: "Department"},
  {country: "France", region: "Hauts-de-France", department: "80 - Somme", category: "Department"},
  {country: "France", region: "Occitanie", department: "81 - Tarn", category: "Department"},
  {country: "France", region: "Occitanie", department: "82 - Tarn-et-Garonne", category: "Department"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur", department: "83 - Var", category: "Department"},
  {country: "France", region: "Provence-Alpes-Côte d'Azur", department: "84 - Vaucluse", category: "Department"},
  {country: "France", region: "Pays de la Loire", department: "85 - Vendée", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "86 - Vienne", category: "Department"},
  {country: "France", region: "Nouvelle-Aquitaine", department: "87 - Haute-Vienne", category: "Department"},
  {country: "France", region: "Grand Est", department: "88 - Vosges", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "89 - Yonne", category: "Department"},
  {country: "France", region: "Bourgogne-Franche-Comté", department: "90 - Territoire de Belfort", category: "Department"},
  {country: "France", region: "Île-de-France", department: "91 - Essonne", category: "Department"},
  {country: "France", region: "Île-de-France", department: "92 - Hauts-de-Seine", category: "Department"},
  {country: "France", region: "Île-de-France", department: "93 - Seine-Saint-Denis", category: "Department"},
  {country: "France", region: "Île-de-France", department: "94 - Val-de-Marne", category: "Department"},
  {country: "France", region: "Île-de-France", department: "95 - Val-d'Oise", category: "Department"},
  {country: "France", region: "Guadeloupe", department: "971 - Guadeloupe", category: "Department"},
  {country: "France", region: "Martinique", department: "972 - Martinique", category: "Department"},
  {country: "France", region: "Guyane", department: "973 - Guyane", category: "Department"},
  {country: "France", region: "La Réunion", department: "974 - La Réunion", category: "Department"},
  {country: "France", region: "La Réunion", department: "976 - Mayotte", category: "Department"}
]

prospect_areas.each do |attr_|
  pa = ProspectArea.new(attr_.merge(validated: true))
  pa.name = pa.set_name
  pa.save
end
puts 'ProspectArea created'


admin = User.new(admin: true, first_name: "Admin", last_name: "System", email: "admin@gal.com", password: "123456", industry: Industry.first, state: "registered", language: "fr")
admin.save(validate: false)

puts 'Admin created'

# 5000.times do |i|
#   User.create!(admin: true, first_name: "test_i#{i}", last_name: "TEST", email: "test-#{i}@gal.com", password: "123456", industry: Industry.first, state: "registered", language: "fr")
# end
