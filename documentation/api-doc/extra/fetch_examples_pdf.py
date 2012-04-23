#
#     This file is part of CasADi.
# 
#     CasADi -- A symbolic framework for dynamic optimization.
#     Copyright (C) 2010 by Joel Andersson, Moritz Diehl, K.U.Leuven. All rights reserved.
# 
#     CasADi is free software; you can redistribute it and/or
#     modify it under the terms of the GNU Lesser General Public
#     License as published by the Free Software Foundation; either
#     version 3 of the License, or (at your option) any later version.
# 
#     CasADi is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#     Lesser General Public License for more details.
# 
#     You should have received a copy of the GNU Lesser General Public
#     License along with CasADi; if not, write to the Free Software
#     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 
"""
Grabs the pdf-compiled examples and puts them in the API tree.
"""

src = '../examples/'
xml = 'XML/index.xml'

import re
import shutil
from lxml import etree
import os

xmlData = etree.parse(xml)

examples = xmlData.findall("//compound[@kind='example']")


for example in examples:
  refid = example.attrib['refid']
  path = '/'.join(refid.split("/")[0:2])+'/'
  example.attrib['refid']
  name=example.findtext("name")
  m=re.search('^(.*)\.py$',name)
  if m:
    try:
      os.makedirs(os.path.dirname('html/'+path+m.group(1) + '.pdf'))
    except:
      pass
    shutil.copyfile(src+m.group(1) + '.pdf','html/'+path+m.group(1) + '.pdf')
    print m.group(1) + '.pdf'
