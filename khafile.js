let project = new Project('Keeb');
project.addSources('Sources');

project.addLibrary('hxbit');
project.addLibrary('safety');
project.addParameter('--macro nullSafety("keeb", Strict)');

resolve(project);
