download.file(url = 'https://raw.githubusercontent.com/obophenotype/cell-ontology/master/cl.obo',
              destfile = 'cl.obo')


clRelations = get_relation_names('cl.obo')


get_ontology('cl.obo',propagate_relationships = c('is_a','develops_from','develops_into','part_of'),extract_tags = 'everything')


save('ancs','cands','chld','done','new.cands','new.done','pars','v',file = 'hede.rda')
load('hede.rda')

download.file(url = 'http://purl.obolibrary.org/obo/uberon.obo',destfile = 'uberon.obo')
forRelationships = get_ontology('uberon.obo',propagate_relationships = c('is_a'))
relationships  = get_descendants(forRelationships,'part_of')
uberon = get_ontology('uberon.obo',propagate_relationships = c(relationships,'contributes_to_morphology_of','is_a'),
                                     extract_tags = 'everything')
