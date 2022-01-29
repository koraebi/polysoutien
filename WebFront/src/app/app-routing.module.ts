import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnnouncementDetailsComponent } from './announcement-details/announcement-details.component';
import { AnnouncementListComponent } from './announcement-list/announcement-list.component';

const routes: Routes = [
  {path: '', redirectTo: 'annonces', pathMatch: 'full'},
  { path: 'annonces', component:  AnnouncementListComponent },
  { path: 'annonces/:annonceId/detail', component:  AnnouncementDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
