# Movie Website (MovieAAA)

This project is a comprehensive PHP-based (localhost) Movie Website that allows users to browse and explore a collection of movies, 
view detailed information, and manage their profiles. Additionally, the website includes an **Admin Panel** that allows administrators to manage movies, upload the movies,
manage categories, manage users, handle subscriptions, and other content on the website.


## Features

### User Features
- **Browse Movies**: Users can browse through a collection of movies organized by categories.
- **View Movie Details**: Detailed information about each movie, including title, genre, synopsis, cast, and reviews.
- **User Authentication**: User registration and login system with session management for secure access to personalized features.
- **User Profile Management**: Users can view and update their profile information.
- **Subscription Management**: Users can manage their subscriptions to access the movies.
- **Responsive Design**: Utilizes HTML, CSS, JavaScript, and PHP for a dynamic and responsive user interface.

### Admin Features
- **Manage Movies**: Administrators can add, edit, or delete movie entries.
- **Manage Categories**: Administrators can add, edit, or delete movie categories.
- **User Management**: Administrators can manage user accounts, including adding, editing, and deleting users.
- **Payment and Subscription Management**: Administrators can manage user payments and verify subscriptions.
- **Admin Authentication**: Secure login system for administrators with different roles and permissions.

### Subscription Verification
- **Subscription Expiry Check**: The system checks for expired subscriptions and restricts access to premium content for users whose subscriptions have expired.
- **Payment Processing**: Users can add, edit, and manage payment methods. The admin panel includes tools for confirming and managing payments.
- **Access Control**: Only users with active subscriptions can access certain premium features or content. Expired subscriptions will display a warning and restrict access.


## Folder Structure

### movieaaa.sql :
  - **Database Structure File**: to set up the necessary tables and data for the website.
    
### movieaaa.zip :
 ### User-Facing Pages:
  - **index.php**: Main entry point of the website, showing an overview of available movies.
  - **all_category.php**: Displays all available movie categories.
  - **detail_movie.php**: Provides detailed information about a specific movie, with subscription verification for premium content.
  - **login.php, register.php**: Handles user authentication and registration.
  - **profile.php**: Allows users to view and update their profile information.
  - **payment.php**: Handles user payments and subscriptions, with confirmation and verification processes.
    
 ### Admin Panel Pages:
  - **manage_movie.php, edit_movie.php**: Admin interface for managing movies.
  - **manage_category.php, edit_category.php**: Admin interface for managing movie categories.
  - **manage_member.php, edit_member.php**: Admin interface for managing users.
  - **manage_admin.php, edit_admin.php**: Admin interface for managing administrator accounts.
  - **manage_payment.php, edit_payment.php**: Admin interface for managing payments and subscriptions.
    
 ### Shared Components:
  - **header.php, side_bar.php**: Common UI components used across different pages for consistent design.
    
 ### Assets and Utilities:
  - **css/, js/, sass/**: Directories for stylesheets, scripts, and SCSS files that handle the visual and interactive aspects of the website.
  - **fonts/, images/**: Contain fonts and images used throughout the website.
  - **function/**: Contains PHP functions and utilities for database connection, payment processing, and subscription verification.
