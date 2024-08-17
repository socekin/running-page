interface ISiteMetadataResult {
  siteTitle: string;
  siteUrl: string;
  description: string;
  logo: string;
  navLinks: {
    name: string;
    url: string;
  }[];
}

const data: ISiteMetadataResult = {
  siteTitle: 'Running Jay',
  siteUrl: 'https://run.jaylife.cc',
  logo: 'https://telegraph-image-7y6.pages.dev/file/86131c954ce23302178d6.png',
  description: 'Personal site and blog',
  navLinks: [
    {
      name: 'Blog',
      url: 'https://jaylife.cc',
    },
    {
      name: 'About',
      url: 'https://jaylife.cc/about/',
    },
  ],
};

export default data;
