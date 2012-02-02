#include "Cell.h"

Cell::Cell(itk::uint64_t cell_x, itk::uint64_t cell_y, itk::uint64_t cell_z)
{
	this->cell_x = cell_x;
	this->cell_y = cell_y;
	this->cell_z = cell_z;
}

itk::uint64_t Cell::getX() const
{
	return cell_x;
}

itk::uint64_t Cell::getY() const
{
	return cell_y;
}

itk::uint64_t Cell::getZ() const
{
	return cell_z;
}