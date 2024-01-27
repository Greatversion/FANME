# FANME (Friends are no more Enemies) - A collaborative Community based Application

## Table of Contents

- [Description](#description)
- [Tech Stack](#tech-stack)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Description

The Community Collaborator app is a platform designed to facilitate collaboration and productivity within communities. Users can create communities, invite others to join them, and collaborate on various projects or tasks. The app offers features such as announcement creation, task assignments, and app lock functionality to enhance focus and productivity.

## Tech Stack

- **Flutter**: Frontend framework for building the mobile application.
- **Firebase**: Backend service for handling authentication, database management (Firestore), and cloud storage.
- **SQLite**: Local database for storing app lock settings and user preferences.

## Features

- **Create Communities**: Users can create communities for specific projects or interests.
- **Invite Members**: Community creators can invite others to join their community by sending invitations.
- **Announcement Creation**: Users can create announcements within communities to request participation in tasks or projects.
- **Task Assignments**: Once an announcement is made, users can volunteer for tasks and collaborate with others within the community.
- **App Lock Functionality**: To promote focus and productivity, users can lock distracting apps on their devices. Access to locked apps is granted only when all participants agree and confirm completion of their tasks.
- **Collaborative Trust System**: The app implements a trust system where participants must collectively grant access to locked apps based on the completion of tasks and mutual trust within the community.

## Installation

To run the Community Collaborator app locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/community-collaborator-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd community-collaborator-app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Ensure you have set up Firebase for the project and added the necessary configuration files.

5. Run the app:

   ```bash
   flutter run
   ```

## Usage

Upon launching the Community Collaborator app, users can create or join communities, view announcements, and participate in collaborative tasks. Users can also utilize the app lock functionality to enhance focus and productivity during task completion. The collaborative trust system ensures that access to locked apps is granted based on mutual trust and completion of assigned tasks within the community.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/new-feature`).
3. Make your changes.
4. Commit your changes (`git commit -am 'Add new feature'`).
5. Push to the branch (`git push origin feature/new-feature`).
6. Create a new Pull Request.

## License

This project is licensed under the [MIT License](LICENSE).

---

Feel free to customize the README further with additional sections or details specific to your project!
