# Task Menager for ActiveNow

## 🛠️ Technologies

### Backend
- **Ruby on Rails 8.0.1**: Server-side framework
- **PostgreSQL**: Primary database system
- **Devise**: Authentication solution
- **Sidekiq**: Background jobs
- **Dry-validation**: Object schema validation
- **ViewComponent**: Reusable UI components
- **RSpec**: Automated testing framework

### Frontend
- **Hotwire (Turbo & Stimulus)**: Modern, minimal-JavaScript approach
- **Tailwind CSS Framework**: Responsive UI design
- **ViewComponents**: Component-based UI architecture

## 📸 Application Screenshots

### Login page
![Landing page](app/assets/images/readme/log_in_image.png)

### Sign in page
![Landing page](app/assets/images/readme/sign_in_image.png)

### Reset password page
![Landing page](app/assets/images/readme/reset_password_image.png)

### Projects List
![Landing page](app/assets/images/readme/projects_view_image.png)

### Show project page
![Landing page](app/assets/images/readme/show_project_image.png)

### Edit project page
![Landing page](app/assets/images/readme/edit_project_image.png)

### Show task page
![Landing page](app/assets/images/readme/show_task_image.png)

### Edit task page
![Landing page](app/assets/images/readme/edit_task_image.png)

### New user email preview
![Landing page](app/assets/images/readme/new_user_email_preview.png)

### Due soon email preview
![Landing page](app/assets/images/readme/due_soon_email_preview.png)

### Video preview
![Kliknij tutaj](https://www.youtube.com/watch?v=EcbzfssJCmM)

---

## ⚙️ Technical Setup

Below you’ll find technical installation instructions for both classic and Dockerized setups.

### Prerequisites (classic setup)
- Ruby 3.x
- Rails 8.0.1
- PostgreSQL

### Classic Installation

1. Clone the repository:
    ```bash
    git clone git@github.com:Nevelito/activenow_zadanie_rekrutacyjne.git
    cd activenow_zadanie_rekrutacyjne
    ```

2. Install dependencies:
    ```bash
    bundle install
    ```

3. Setup database:
    ```bash
    rails db:create 
    rails db:migrate
    rails db:seed
    ```

4. Start the server:
    ```bash
    bin/dev
    ```

# Test

Task Menager uses [RSpec](https://github.com/rspec/rspec-rails) to automate testing. The test suite primarily covers controllers, components, ensuring the reliability and correctness of the application's core logic.

1. Run RSpec test in terminal:
    ```bash
    rspec
    ```
   
2. Test new User email preview:
   ```bash
    rails c
    user = User.last
    UserMailer.welcome_email(user).deliver_now  
    ```

3. Test due soon email preview:
   ```bash
    rails c
    task = Task.last
    TaskMailer.due_soon_email(task).deliver_now  
    ```

