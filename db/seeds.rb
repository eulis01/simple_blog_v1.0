# this is Me Creating user and Post to start the Application.

eulis = User.create(email: "e@b.com", name: "Eulis", image_url: "https://www.coindesk.com/wp-content/uploads/2018/12/bitcoin-image.jpg", bio: "what's The Meaning of Life?", password: "123456")

tom = User.create(email: "t@t.com", name: "Thomas", image_url: "https://vignette2.wikia.nocookie.net/villains/images/f/fc/TomT%26J.jpg/revision/latest?cb=20111018202253", bio: "Hey! I'm tom From Tom & Jerry", password: "654321")

Post.create(title: "Learning Better", image_url: "http://www.skillmile.com/wp-content/uploads/2018/08/e-learning-page-option-original.jpg", description: "The best Way to learn something new is by doing it that specific something and making it part of your life. Also we Learn better by Building and creating Project hands on 👨🏻‍💻 Keep on coding and Learning.", user_id: eulis.id)

Post.create(title: "Capitalism. Let's talk about it.", image_url: "https://allhdwallpapers.com/wp-content/uploads/2015/06/Tom-And-Jerry-9.jpg", description: "Tom and Jerry is an American animated series of short films created in 1940 by William Hanna and Joseph Barbera. It centers on a rivalry between its two title characters, Tom, a cat, and Jerry, a mouse, and many recurring characters, based around slapstick comedy.", user_id: tom.id)
