Distro-hoppers --> preserve user settings
===========================================

Hi everyone,

Wanted to share a tip, hope some might find useful; particularly those who "distro-hop" on a regular basis.

One of the downsides of distro-hopping is may need to re-create your /home directory after a reinstall. Of course, this is where many people: store data like their documents, downloads etc., and most Linux systems also store config and cache files there as well.

So when installing a new system, be it from distro-hopping or just doing a clean install (we all love a clean fresh system), any data in your /home directory may well get erased in the process. Also it may mean you need to reconfigure things such as your web browser profile etc. It can all get a bit tedious, not to mention the risk of inadvertently losing data.

Have been using a fairly simple solution for this. In my /home partition, keep a directory called 'common' to store this kind of data permanently (documents, downloads, browser config, game data etc.). Then link these directories into /home directory. Eg: I have my downloads in /home/common/Downloads, rather than /home/shaun/Downloads, and so on for Documents and other stuff. So - if my /home/shaun directory gets deleted or corrupted etc., there is no loss of this critical data. If I reinstall the system, simply delete the old /home/shaun directory but NOT format the /home partition - leaving /home/common intact.

After the install is done, run a simple script that creates the links to the /home/common directory in my new /home/shaun directory. It takes only a few seconds, and bang - my documents, downloads, browser profile etc are all set up on my new installation ready to go. It saves a lot of work setting everything up from scratch after a new install/reinstall.

This script sets up directories for Firefox specifically. I also use Lutris for gaming, so it sets up directories for Lutris as well. Feel free to customise it to suit yourself.

Credit
+++++++++

Shawn O'Leary <https://www.facebook.com/shaunmichelle1>
