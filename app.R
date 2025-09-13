# This is a self-contained Shiny application that creates a simple website
# for an NGO. You can run this file directly in RStudio to launch the website.

# Install and load required packages: shiny, shinythemes, DT, and ggplot2.
# install.packages("shiny")
# install.packages("shinythemes")
# install.packages("ggplot2")
# install.packages("DT")
library(shiny)
library(shinythemes)
library(ggplot2)
library(DT)

# Define the user interface (UI)
# The UI defines the layout and appearance of the web application.
ui <- fluidPage(
  # Use a theme from shinythemes for a professional look.
  theme = shinytheme("flatly"),
  
  # Add custom CSS for fonts and colors
  tags$head(
    tags$style(HTML("
      body {
        font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
      }
      h1, h2, h3, h4, h5, h6 {
        color: #2c3e50; /* Darker heading color */
      }
      .well-panel {
        background-color: #f8f9fa; /* Light gray for panels */
        border: 1px solid #e9ecef;
      }
      .dt-row-odd {
        background-color: #f2f2f2; /* Light gray for odd rows */
      }
      .dt-row-even {
        background-color: #ffffff; /* White for even rows */
      }
    "))
  ),
  
  # Use navbarPage to create a multi-page website with a navigation bar at the top.
  # The title of the website that appears in the navigation bar.
  navbarPage("Savitribai Phule Bahu-uddeshiya Seva Bhavi Sanstha",
             
             # --- Home Page ---
             # The 'tabPanel' function creates a separate page or tab in the navigation bar.
             tabPanel("Home",
                      # fluidRow and column are used to create a responsive grid layout.
                      fluidRow(
                        column(12,
                               h1("Welcome to Our NGO", align = "center", style = "color: #2c3e50; font-weight: bold;"),
                               p("Our mission is to empower communities and create a sustainable future for all. We believe that by working together, we can make a significant impact on the world.", align = "center", style = "font-size: 1.2em;"),
                               hr(style = "border-top: 1px solid #ddd;"),
                               
                               # Placeholder image
                               div(style = "text-align: center; margin-bottom: 2em;",
                                   img(src = "https://placehold.co/1200x400/3498db/fff?text=Our+Mission+in+Action", style = "width: 100%; max-width: 800px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);")
                               ),
                               
                               h3("Our Mission", align = "center", style = "color: #34495e;"),
                               p("We are dedicated to providing support and resources to underserved populations. Through our initiatives in education, healthcare, and environmental conservation, we strive to build stronger, more resilient communities. Our work is driven by the principles of compassion, integrity, and social justice.", align = "justify"),
                               br(),
                               
                               # Stylized Call to Action section
                               div(
                                 style = "background-color: #e8f5e9; padding: 2em; border-radius: 12px; text-align: center; margin-top: 2em;",
                                 h4("Get Involved Today!", style = "color: #2c3e50;"),
                                 p("Your support helps us continue our vital work. Whether you volunteer, donate, or spread the word, you can make a difference."),
                                 tags$a(href = "#", "Donate Now", class = "btn btn-primary btn-lg", style = "background-color: #27ae60; border-color: #27ae60;")
                               )
                        )
                      )
             ),
             
             # --- About Us Dropdown Menu ---
             navbarMenu("About Us",
                        tabPanel("Our Story",
                                 fluidRow(
                                   column(12,
                                          h2("Who We Are"),
                                          p("Founded in 20XX, our organization started as a small group of volunteers with a shared vision. Today, we have grown into a global network of passionate individuals committed to making a difference."),
                                          h3("Financial Transparency"),
                                          p("We are committed to financial transparency and accountability. All our financial reports are publicly available to ensure our donors know exactly how their contributions are being used.")
                                   )
                                 )
                        ),
                        tabPanel("Team Members",
                                 fluidRow(
                                   column(12,
                                          h2("Meet Our Team"),
                                          p("Our team is composed of dedicated professionals who bring a diverse range of skills and experiences to our work. We are united by our common goal of creating positive change."),
                                          
                                          # Use a horizontal rule to separate the main text from the bio.
                                          hr(),
                                          
                                          # The main container for the two-column layout.
                                          fluidRow(
                                            # Left column for the profile image. It takes up 2 out of 12 grid units.
                                            column(2,
                                                   # The `tags$img` function displays the image.
                                                   # The `src` attribute should be the path to the image file. Place your CV image in a 'www' folder within your app directory.
                                                   # The `class = "img-circle"` and `style` attributes make the image round and responsive.
                                                   tags$img(src = "CV_Dr_Siddhant_A_lahase_08092025.pdf", style = "max-width: 100%; height: auto; border-radius: 50%;"),
                                                   br(), # Adds a line break below the image
                                                   div(
                                                     style = "text-align: center;",
                                                     tags$a(href = "www.linkedin.com/in/dr-siddhant-lahase-859330123", "LinkedIn Profile", target = "_blank")
                                                   )
                                            ),
                                            
                                            # Right column for the bio text. It takes up 10 out of 12 grid units.
                                            column(10,
                                                   # Use markdown headings for a clear hierarchy.
                                                   h3("Dr. Siddhant A. Lahase"),
                                                   p(tags$strong("Master of Public Health")),
                                                   p("Dr. Siddhant A. Lahase is a highly motivated public health professional with a strong foundation in both clinical and public health practice. He is dedicated to strengthening community health systems through evidence-based decision-making. His skills include Public Health Program Planning & Implementation, Disease Surveillance & Control, and Community Engagement. He is proficient in data analysis using tools such as R, Power BI, and Microsoft Excel."),
                                                   
                                                   # Use a list for his professional experience.
                                                   h4("Key Experience"),
                                                   tags$ul(
                                                     tags$li("As a **Field Officer** at ICMR-NIV, he utilizes R, Power BI, and Tableau to analyze and visualize public health data for health technology assessments."),
                                                     tags$li("While a **Field Investigator** for ICMR-NITVAR, he led field investigations for a major National Tuberculosis prevalence research study and managed the entire data collection process."),
                                                     tags$li("In his role as a **Community Health Officer**, he spearheaded the on-the-ground implementation of national health programs through community-based screenings and health education."),
                                                     tags$li("He also has a clinical background as a **Registered Medical Officer** at Siddhivinayak Accident Hospital and a **Private Practitioner**, where he gained a strong foundation in patient care and management.")
                                                   )
                                            )
                                          )
                                   )
                                 )
                        ),
                        tabPanel("Mentors",
                                 fluidRow(
                                   column(12,
                                          h2("Our Mentors"),
                                          p("Our mentors provide invaluable guidance and support, helping us to navigate challenges and maximize our impact.")
                                   )
                                 )
                        ),
                        tabPanel("Committees",
                                 fluidRow(
                                   column(12,
                                          h2("Committees and Governance"),
                                          p("Our work is guided by various committees, each focusing on key areas such as finance, strategy, and program oversight.")
                                   )
                                 )
                        )
             ),
             
             # --- Our Projects Page ---
             tabPanel("Our Projects",
                      fluidRow(
                        column(12,
                               h2("Current Projects"),
                               p("Here's a look at some of our ongoing initiatives and their impact."),
                               br(),
                               # Placeholder image for projects
                               div(style = "text-align: center; margin-bottom: 2em;",
                                   img(src = "https://placehold.co/1200x400/2980b9/fff?text=Our+Projects+Making+an+Impact", style = "width: 100%; max-width: 800px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);")
                               ),
                               div(
                                 style = "background-color: #ecf0f1; border: 1px solid #bdc3c7; padding: 16px; border-radius: 8px; margin-bottom: 16px;",
                                 h4("Project A: Education for All"),
                                 p("This project focuses on providing school supplies and scholarships to students in rural areas.")
                               ),
                               div(
                                 style = "background-color: #ecf0f1; border: 1px solid #bdc3c7; padding: 16px; border-radius: 8px; margin-bottom: 16px;",
                                 h4("Project B: Clean Water Initiative"),
                                 p("We are working to install water purification systems in communities that lack access to clean drinking water.")
                               )
                        )
                      )
             ),
             
             # --- Public Health Page with Animation ---
             tabPanel("Public Health",
                      fluidRow(
                        column(12,
                               h2("Our Public Health Initiatives"),
                               p("This interactive chart shows the historical progress of our public health campaigns. The animation simulates our growing reach over time.")
                        )
                      ),
                      fluidRow(
                        column(12, align = "center",
                               h4("Campaign Reach Over Time"),
                               plotOutput("animated_plot", height = "400px"),
                               sliderInput("year_slider", "Year", min = 2021, max = 2025, value = 2021, step = 1, animate = animationOptions(interval = 500, loop = FALSE))
                        )
                      )
             ),
             
             # --- History of Work Page ---
             tabPanel("History of Work",
                      fluidRow(
                        column(12,
                               h2("A History of Impact"),
                               p("Since our founding, we have grown from a local effort to a global network. This timeline highlights our key milestones and achievements."),
                               div(
                                 style = "background-color: #f7f7f7; padding: 20px; border-radius: 8px;",
                                 tags$ul(
                                   tags$li(tags$strong("20XX: "), "Organization founded with a focus on local education."),
                                   tags$li(tags$strong("20XX: "), "Launched our first clean water project in a neighboring region."),
                                   tags$li(tags$strong("20XX: "), "Established our official fellowship program."),
                                   tags$li(tags$strong("20XX: "), "Expanded our reach internationally, establishing partnerships in three new countries.")
                                 )
                               )
                        )
                      )
             ),
             
             # --- Future Projects Page ---
             tabPanel("Future Projects",
                      fluidRow(
                        column(12,
                               h2("Our Vision for the Future"),
                               p("We are continuously planning new projects to address pressing global issues. Here's a look at what we're working on next."),
                               div(
                                 style = "border-left: 4px solid #3498db; padding-left: 15px; margin-top: 20px;",
                                 h3("Sustainable Agriculture Initiative"),
                                 p("Our upcoming project aims to empower small-scale farmers with sustainable farming techniques to improve food security and economic stability."),
                                 br(),
                                 h3("Digital Literacy Program"),
                                 p("We plan to launch a program to teach essential computer and internet skills to underserved youth, preparing them for the digital economy.")
                               )
                        )
                      )
             ),
             
             # --- Aims & Objectives Page ---
             tabPanel("Aims & Objectives",
                      fluidRow(
                        column(12,
                               h2("Our Core Aims & Objectives"),
                               p("Every action we take is guided by a clear set of goals."),
                               br(),
                               h3("Aims"),
                               tags$ul(
                                 tags$li("To alleviate poverty and improve quality of life."),
                                 tags$li("To promote universal access to education and healthcare."),
                                 tags$li("To advocate for environmental conservation and sustainability.")
                               ),
                               h3("Objectives"),
                               tags$ul(
                                 tags$li("Raise $500,000 in annual funding by 2027."),
                                 tags$li("Provide clean water access to 10,000 new people each year."),
                                 tags$li("Enroll 5,000 students in our education programs.")
                               )
                        )
                      )
             ),
             
             # --- Data Dashboard Page ---
             tabPanel("Data Dashboard",
                      fluidRow(
                        column(12,
                               h2("Our Impact in Numbers"),
                               p("Explore the data behind our projects. Use the controls on the left to filter the information."),
                               br()
                        )
                      ),
                      fluidRow(
                        column(4,
                               wellPanel(
                                 h4("Dashboard Controls"),
                                 # An interactive input to select a project.
                                 selectInput("project", "Choose a Project:",
                                             choices = c("Education", "Clean Water", "Health")),
                                 # An interactive input to filter by funding level.
                                 sliderInput("funding", "Funding Level ($):",
                                             min = 10000, max = 50000, value = c(20000, 40000), step = 1000)
                               )
                        ),
                        column(8,
                               h3("Project Funding and Impact"),
                               plotOutput("funding_plot"),
                               hr(),
                               h3("Detailed Data Table"),
                               DTOutput("data_table")
                        )
                      )
             ),
             
             # --- Donate Us Page ---
             tabPanel("Donate",
                      fluidRow(
                        column(12,
                               h2("Support Our Mission", align = "center"),
                               p("Your generous contribution allows us to continue our work and expand our reach to more communities. Every dollar makes a difference.", align = "center"),
                               div(
                                 style = "background-color: #f7f7f7; padding: 2em; border-radius: 8px; text-align: center;",
                                 h3("How to Donate"),
                                 p("You can make a one-time donation or set up a recurring contribution."),
                                 tags$button("Donate Now", class = "btn btn-success btn-lg", style = "background-color: #27ae60; border-color: #27ae60;")
                               )
                        )
                      )
             ),
             
             # --- Join Our Team Page (Volunteer & Careers) ---
             tabPanel("Join Our Team",
                      fluidRow(
                        column(12,
                               h2("Become a Part of Our Team"),
                               p("Whether you're looking for a short-term volunteer role or a long-term career, we have opportunities for you to make a difference."),
                               br(),
                               # Volunteer section
                               div(
                                 style = "background-color: #ecf0f1; padding: 16px; border-radius: 8px; margin-bottom: 20px;",
                                 h3("Volunteer Opportunities"),
                                 p("Our volunteers are the backbone of our organization. We're always looking for dedicated individuals to help with our projects, events, and administrative tasks. No prior experience is required, just a passion for our cause!"),
                                 tags$a(href = "mailto:volunteer@ngo.org", "Email us to volunteer", class = "btn btn-info")
                               ),
                               # Career & Fellowship section
                               div(
                                 style = "background-color: #e8f5e9; padding: 16px; border-radius: 8px;",
                                 h3("Careers & Fellowships"),
                                 p("We offer full-time positions and competitive fellowships for driven professionals. Join a team of experts dedicated to creating lasting social change."),
                                 h4("Current Openings"),
                                 tags$ul(
                                   tags$li("Program Manager, Education Initiative"),
                                   tags$li("Data Analyst, Impact Measurement"),
                                   tags$li("Social Media Coordinator")
                                 ),
                                 h4("Fellowship Program"),
                                 p("Our annual fellowship program provides hands-on experience and mentorship for emerging leaders in the non-profit sector. Applications open every Fall."),
                                 tags$a(href = "mailto:careers@ngo.org", "Apply Now", class = "btn btn-info")
                               )
                        )
                      )
             ),
             
             # --- Media Centre Dropdown Menu ---
             navbarMenu("Media Centre",
                        tabPanel("Press Releases",
                                 fluidRow(
                                   column(12,
                                          h2("Press Releases"),
                                          p("Stay up-to-date with our official news and announcements."),
                                          tags$ul(
                                            tags$li("Press Release: New Partnership to Expand Global Reach"),
                                            tags$li("Press Release: Annual Impact Report Now Available")
                                          )
                                   )
                                 )
                        ),
                        tabPanel("Workshops",
                                 fluidRow(
                                   column(12,
                                          h2("Workshops"),
                                          p("Join our workshops to learn new skills and connect with our community."),
                                          tags$ul(
                                            tags$li("Upcoming Workshop: Introduction to Sustainable Farming"),
                                            tags$li("Upcoming Workshop: Community Health and Wellness")
                                          )
                                   )
                                 )
                        ),
                        tabPanel("Events",
                                 fluidRow(
                                   column(12,
                                          h2("Events Calendar"),
                                          p("Check out our upcoming events, including fundraisers, conferences, and community gatherings."),
                                          tags$ul(
                                            tags$li("Annual Fundraising Gala"),
                                            tags$li("International Water Conservation Conference")
                                          )
                                   )
                                 )
                        )
             ),
             
             # --- Contact Page ---
             tabPanel("Contact",
                      fluidRow(
                        column(12,
                               h2("Get In Touch"),
                               p("We would love to hear from you! Please feel free to reach out with any questions, partnership opportunities, or to learn more about our work."),
                               tags$ul(
                                 tags$li("Email: ", tags$a(href = "mailto:info@ngo.org", "info@ngo.org")),
                                 tags$li("Phone: ", "(123) 456-7890"),
                                 tags$li("Address: 123 Main Street, Anytown, USA")
                               ),
                               br(),
                               h4("Follow Us"),
                               p("Stay updated with our latest news and events on social media."),
                               tags$ul(
                                 tags$li(tags$a(href = "#", "Facebook")),
                                 tags$li(tags$a(href = "#", "Twitter")),
                                 tags$li(tags$a(href = "#", "Instagram"))
                               )
                        )
                      )
             )
  )
)

# Define the server logic
# The server is where you would put the code for data processing and interactivity.
server <- function(input, output) {
  # Create some sample data for the dashboards.
  # In a real app, you would load this from a file or database.
  impact_data <- data.frame(
    project = rep(c("Education", "Clean Water", "Health"), each = 5),
    year = rep(2021:2025, times = 3),
    funding = c(
      seq(20000, 40000, length.out = 5), # Education
      seq(15000, 45000, length.out = 5), # Clean Water
      seq(18000, 38000, length.out = 5)  # Health
    ),
    beneficiaries = c(
      seq(500, 1500, length.out = 5), # Education
      seq(300, 1000, length.out = 5), # Clean Water
      seq(250, 900, length.out = 5)  # Health
    )
  )
  
  public_health_data <- data.frame(
    year = 2021:2025,
    reach = c(500, 1500, 3000, 5000, 7500)
  )
  
  # A reactive expression to filter the impact data based on user input.
  filtered_impact_data <- reactive({
    impact_data[impact_data$project == input$project &
                  impact_data$funding >= input$funding[1] &
                  impact_data$funding <= input$funding[2], ]
  })
  
  # Render a plot showing funding over time for the selected project.
  output$funding_plot <- renderPlot({
    
    # Conditional chart rendering based on the selected project
    if (input$project == "Education") {
      ggplot(filtered_impact_data(), aes(x = year, y = funding)) +
        geom_point(color = "#3498db", size = 4) +
        geom_line(color = "#3498db", size = 1) +
        labs(title = paste("Funding Trend for", input$project, "Project"),
             x = "Year", y = "Funding ($)") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, face = "bold"))
    } else if (input$project == "Clean Water") {
      ggplot(filtered_impact_data(), aes(x = as.factor(year), y = funding)) +
        geom_segment(aes(x = as.factor(year), xend = as.factor(year), y = 0, yend = funding), color = "#27ae60", size = 1.5) +
        geom_point(color = "#2c3e50", size = 5) +
        labs(title = paste("Funding Data for", input$project, "Project"),
             x = "Year", y = "Funding ($)") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, face = "bold"),
              legend.position = "none")
    } else if (input$project == "Health") {
      ggplot(filtered_impact_data(), aes(x = as.factor(year), y = funding)) +
        geom_bar(stat = "identity", fill = "#e74c3c") +
        labs(title = paste("Funding Trend for", input$project, "Project"),
             x = "Year", y = "Funding ($)") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, face = "bold"),
              axis.text.x = element_text(angle = 45, hjust = 1))
    }
    
  })
  
  # Render a table showing the detailed, filtered impact data with styling
  output$data_table <- renderDT({
    datatable(filtered_impact_data(),
              options = list(pageLength = 5, dom = 't'), # show 5 rows, hide search box and other controls
              rownames = FALSE,
              class = "display compact",
              style = "bootstrap"
    )
  })
  
  # Render the animated public health plot.
  output$animated_plot <- renderPlot({
    # Filter data up to the selected year from the slider
    plot_data <- public_health_data[public_health_data$year <= input$year_slider, ]
    
    # Create the bar chart with ggplot2
    ggplot(plot_data, aes(x = as.factor(year), y = reach)) +
      geom_bar(stat = "identity", fill = "#27ae60") +
      labs(title = paste("Public Health Campaign Reach by", input$year_slider),
           x = "Year", y = "Number of People Reached") +
      ylim(0, max(public_health_data$reach) * 1.1) + # Set a fixed y-axis limit
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5, face = "bold"))
  })
}

# Run the application
shinyApp(ui = ui, server = server)

