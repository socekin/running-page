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

const getBasePath = () => {
  const baseUrl = import.meta.env.BASE_URL;
  return baseUrl === '/' ? '' : baseUrl;
};

const data: ISiteMetadataResult = {
  siteTitle: 'Running Jay',
  siteUrl: 'https://run.jaylife.cc',
  logo: 'https://s2.loli.net/2025/05/02/3cfszSZrjiWqQ8E.png',
  description: 'Personal site and blog',
  navLinks: [
    {
      name: 'Summary',
      url: `${getBasePath()}/summary`,
    },
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
