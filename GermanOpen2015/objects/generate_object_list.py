#! /usr/bin/env python
# coding: utf-8

# In each object group directory, run $ 
# ```
# mkdir thumbs; mogrify -resize 200x200 -format jpg -quality 100 -path thumbs *.jpg
# ```

# In[2]:

import os, sys


# In[3]:

known, alike, special, containers = "known", "alike", "special", "containers"
groups = [known, alike, special, containers]

placements = {"drink":"cabinet", "food":"stove", "tool":"counter", "decoration":"couchtable", "leisure":"small_table"}

# In[4]:

pictures = {}
for group in groups:
    path = os.path.join(".", group, "thumbs")
    print path
    pictures[group] = [os.path.join(path, p) for p in os.listdir(path)]


# In[5]:

print pictures


# In[6]:

def generate_row(group, filepath):
    fileName, fileExtension = os.path.splitext(filepath)
    filename = os.path.basename(fileName)
    parts = filename.split(" - ")
    print parts
    name = parts[0] if len(parts) > 0 else ""
    category = parts[1] if len(parts) > 1 else ""
    return """<tr>
        <td><img src="{3}"/> <td>{0}</td> <td>{1}</td> <td>{2}</td>  <td>{4}</td> 
</tr>""".format(name, category, group, filepath, placements.get(category, ""))


# In[7]:

table_rows = []
for group, pics in pictures.iteritems():
    table_rows += [generate_row(group, pic) for pic in pics]
    
table = """<table>{0}</table>""".format("".join(table_rows))


# In[8]:

SIZE = (180,180)
html = """<html>
        <head>
            <style>img{{width:100%;  max-width:{0}px}}
            table, th, td {{ border: 1px solid black; border-collapse: collapse;}}</style>
        </head>
        <body style="font-family:arial; font-size:16px">
        {table}\n\t</body></html>""".format(SIZE[0], SIZE[1], table=table)


# In[9]:

with open("objects.html", "w") as f:
    f.write(html)


# In[ ]:



