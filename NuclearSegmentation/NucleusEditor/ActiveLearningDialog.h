/*=========================================================================
Copyright 2009 Rensselaer Polytechnic Institute
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 
=========================================================================*/
#ifndef ACTIVELEARNINGDIALOG_H
#define ACTIVELEARNINGDIALOG_H

#include <QtGui/QAction>
#include <QtGui/QWidget>
#include <QtGui/QVBoxLayout>
#include <QtGui/QHBoxLayout>
#include <QtGui/QGridLayout>
#include <QtGui/QDialog>
#include <QtGui/QColorDialog>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtCore/QStringList>
#include <QtCore/QSignalMapper>
#include <QtGui/QTableWidget>
#include <QtGui/QTableWidgetItem>
#include <QtGui/QLineEdit>
#include <QtGui/QPlainTextEdit>
#include <QHeaderView>
#include <QRadioButton>
#include <QButtonGroup>

#include <vtkTable.h>
#include <vtkSmartPointer.h>
#include <vtkVariant.h>

#define MAX(a,b) (((a) > (b))?(a):(b))
#define MIN(a,b) (((a) < (b))?(a):(b))

class ActiveLearningDialog : public QDialog
{
	Q_OBJECT
public:
	ActiveLearningDialog::ActiveLearningDialog(std::vector<QImage> snapshot, vtkSmartPointer<vtkTable> table,int num_classes,std::vector<int> active_query,std::vector<int>top_feats,QWidget *parent=0);
	std::vector<QHBoxLayout *> Sample_Details(QImage snapshot, vtkSmartPointer<vtkTable> table,int num_classes,int active_query,std::vector<int>top_feats,int group);
	bool finish;
	//QLineEdit *lineEdit;
	std::vector<QRadioButton *> button_vector;
	std::pair<QImage, std::vector<int> >temp_pair;
	std::vector<int> queries;
	std::vector<int> classes_chosen;
	std::vector<std::pair<int,int> > query_label;
	std::vector<QButtonGroup *> buttongroup;
	
	//Top-row of the window 
	//QHBoxLayout *topRow;
	////Bottom-row of the window 
	//QHBoxLayout *botRow;
	int num_of_classes;


private slots:
	void finished();
	void Set_Class();
	
	
private:
	//QMap<QString, QColor> m_snapshot;
	//QSignalMapper *signalMapper;
	

};


#endif
