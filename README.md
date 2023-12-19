# ch8_navigator

A new Flutter project.

Here we have created with homepage that can navigate to the About page as a fullscreenDialog.

The fullscreenDialog gives the about page a default close action button.
By tapping the home page's FloatingActionButton, the Navigator MaterialPageRoute builder builds the contents for the route,
in this case the gratitude page.

Through the Gratitude constructor, data is passed tu unselected Radio buttons.
From the gratitude page, a list of Radio buttons gives a choice to select a gratitude.

By tapping the AppBar action button, the Navigator.pop method passes the selected gratitude value back to the Home Text widget.

From the home page, we called the Navigator.push method by using the await keyword,
and the has being waiting to receive à value.

Once the About page's Navogator.push method is called, it returns a value to the home page's _gratitudeResponse variable.
Using a await keyword is a powerful and straightforward feature to implement.
